tableextension 50624 "Sales Header Table Ext" extends "Sales Header"
{
    fields
    {
        field(50620; "Synchronise"; Boolean)
        {
            Caption = 'Synchronise';
            DataClassification = CustomerContent;
            InitValue = false;
            Description = 'Indicates if the customer has been synchronized with the CRM system';
        }
        field(50621; "Created by CRM"; Boolean)
        {
            Caption = 'Created by CRM';
            DataClassification = CustomerContent;
            InitValue = false;
        }
        field(50622; "CRM Subject"; Text[255])
        {
            Caption = 'CRM Subject';
            DataClassification = CustomerContent;
        }
    }

    /* Automatic generation of approval requests for quotes created via CRM not working, so removed.
        trigger OnAfterInsert()
        begin
            if Rec."Created by CRM" then
                TriggerQuoteApprovalRequest();
        end;

        local procedure TriggerQuoteApprovalRequest()
        var
            SalesHeader: Record "Sales Header";
            ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        begin
            LogDebug('OnAfterInsert trigger fired for quote: ' + Rec."No.");
            LogDebug('Created by CRM: ' + Format(Rec."Created by CRM"));

            if SalesHeader.Get(SalesHeader."Document Type"::Quote, Rec."No.") then begin
                LogDebug('Sales Header found: ' + SalesHeader."No.");
                begin
                    if ApprovalsMgmt.CheckSalesApprovalPossible(Rec) then begin
                        LogDebug('Approval possible for quote: ' + Rec."No.");
                        ApprovalsMgmt.OnSendSalesDocForApproval(Rec);
                    end else
                        LogDebug('Approval not possible for quote: ' + Rec."No.");
                end;
            end else
                LogDebug('Sales Header NOT found for: ' + Rec."No.");
        end;

        local procedure LogDebug(LogMessage: Text)
        var
            DebugLog: Record "Debug Log";
        begin
            DebugLog.Init();
            DebugLog."Entry No." := 0;
            DebugLog."LogTimestamp" := CurrentDateTime();
            DebugLog."Message" := CopyStr(LogMessage, 1, 250);
            DebugLog.Insert();
        end;
    */ // Automatic generation of approval requests for quotes created via CRM not working, so removed.

}
