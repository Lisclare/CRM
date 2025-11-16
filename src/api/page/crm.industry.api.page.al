// API for Zoho CRM integration
page 50625 "CRM Industry"
{
    APIVersion = 'v2.0';
    APIPublisher = 'Lisclare';
    APIGroup = 'CRM';
    EntityCaption = 'Industry';
    EntitySetCaption = 'Industries';
    ChangeTrackingAllowed = true;
    DelayedInsert = true;
    EntityName = 'industry';
    EntitySetName = 'industries';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = Industry;
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
                            Error(BlankIndustryCodeErr);
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
        Industry: Record Industry;
        IndustryRecordRef: RecordRef;
    begin
        if Rec."Code" = '' then
            Error(NotProvidedIndustryCodeErr);

        Industry.SetRange("Code", Rec."Code");
        if not Industry.IsEmpty() then
            Rec.Insert();

        Rec.Insert(true);

        IndustryRecordRef.GetTable(Rec);
        GraphMgtGeneralTools.ProcessNewRecordFromAPI(IndustryRecordRef, TempFieldSet, CurrentDateTime());
        IndustryRecordRef.SetTable(Rec);

        Rec.Modify(true);
        SetCalculatedFields();
        exit(false);
    end;

    trigger OnModifyRecord(): Boolean
    var
        Industry: Record Industry;
    begin
        Industry.GetBySystemId(Rec.SystemId);

        if Rec."Code" = Industry."Code" then
            Rec.Modify(true)
        else begin
            Industry.TransferFields(Rec, false);
            Industry.Rename(Rec."Code");
            Rec.TransferFields(Industry);
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
        NotProvidedIndustryCodeErr: Label 'A "code" must be provided.', Comment = 'code is a field name and should not be translated.';
        BlankIndustryCodeErr: Label 'The blank "code" is not allowed.', Comment = 'code is a field name and should not be translated.';

    local procedure SetCalculatedFields()
    begin
        // No calculated fields for Industry table
    end;

    local procedure ClearCalculatedFields()
    begin
        Clear(Rec.SystemId);
        TempFieldSet.DeleteAll();
    end;

    local procedure RegisterFieldSet(FieldNo: Integer)
    begin
        if TempFieldSet.Get(Database::Industry, FieldNo) then
            exit;

        TempFieldSet.Init();
        TempFieldSet.TableNo := Database::Industry;
        TempFieldSet.Validate("No.", FieldNo);
        TempFieldSet.Insert(true);
    end;
}
