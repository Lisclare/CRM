// API for Zoho CRM integration
page 50624 "CRM Ownership"
{
    APIVersion = 'v2.0';
    APIPublisher = 'Lisclare';
    APIGroup = 'CRM';
    EntityCaption = 'Ownership';
    EntitySetCaption = 'Ownerships';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'ownership';
    EntitySetName = 'ownerships';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = Ownership;
    Extensible = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id';
                    Editable = false;
                }
                field(code; Rec."Code")
                {
                    Caption = 'Code';
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if Rec."Code" = '' then
                            Error(BlankOwnershipCodeErr);
                        RegisterFieldSet(Rec.FieldNo("Code"));
                    end;
                }
                field(description; Rec."Description")
                {
                    Caption = 'Description';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("Description"));
                    end;
                }
                field(crmId; Rec."CRM ID")
                {
                    Caption = 'CRM ID';

                    trigger OnValidate()
                    begin
                        RegisterFieldSet(Rec.FieldNo("CRM ID"));
                    end;
                }
                field(lastModifiedDateTime; Rec.SystemModifiedAt)
                {
                    Caption = 'Last Modified Date';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        SetCalculatedFields();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        Ownership: Record Ownership;
        OwnershipRecordRef: RecordRef;
    begin
        if Rec."Code" = '' then
            Error(NotProvidedOwnershipCodeErr);

        Ownership.SetRange("Code", Rec."Code");
        if not Ownership.IsEmpty() then
            Rec.Insert();

        Rec.Insert(true);

        OwnershipRecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(OwnershipRecordRef, TempFieldSet, CurrentDateTime());
        OwnershipRecordRef.SetTable(Rec);

        Rec.Modify(true);
        SetCalculatedFields();
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    var
        Ownership: Record Ownership;
    begin
        Ownership.GetBySystemId(Rec.SystemId);

        if Rec."Code" = Ownership."Code" then
            Rec.Modify(true)
        else begin
            Ownership.TransferFields(Rec, false);
            Ownership.Rename(Rec."Code");
            Rec.TransferFields(Ownership);
        end;

        SetCalculatedFields();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        ClearCalculatedFields();
    end;

    var
        TempFieldSet: Record 2000000041 temporary;
        GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
        NotProvidedOwnershipCodeErr: Label 'A "code" must be provided.', Comment = 'code is a field name and should not be translated.';
        BlankOwnershipCodeErr: Label 'The blank "code" is not allowed.', Comment = 'code is a field name and should not be translated.';

    local procedure SetCalculatedFields()
    begin
        // No calculated fields for Ownership table
    end;

    local procedure ClearCalculatedFields()
    begin
        Clear(Rec.SystemId);
        TempFieldSet.DeleteAll();
    end;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::Ownership, FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::Ownership;
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;
}
