pageextension 50624 "Customer Card Page Ext" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("Created by CRM"; Rec."Created by CRM")
            {
                ApplicationArea = All;
                Importance = Standard;
                ToolTip = 'Specifies whether this customer was created by CRM.';
                Editable = false; // Lock so it only can be changed by API
            }
            field("Ownership"; Rec.Ownership)
            {
                ApplicationArea = All;
                Importance = Standard;
                ToolTip = 'Specifies the ownership type of this customer.';
            }
            field("Industry"; Rec.Industry)
            {
                ApplicationArea = All;
                Importance = Promoted;
                ToolTip = 'Specifies the industry type of this customer.';
            }
        }
        addbefore(Statistics)
        {
            group("CRM Integration")
            {
                Caption = 'CRM Integration';

                field("Synchronise"; Rec.Synchronise)
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies if this customer has been synchronised with the CRM system.';
                }
            }
        }
        // Field used to hold billing info from CRM
        modify("Name 2")
        {
            Visible = true;
            Importance = Standard;
            Caption = 'Billing info from CRM';
            ToolTip = 'Underlying field is Name 2 (caption is changed to Bill-to Customer)';
        }
    }
    // Moved from table extension to page extension to prevent user deletion but allow programmatic deletion
    trigger OnDeleteRecord(): Boolean
    begin
        if Rec."Created by CRM" then
            Error('Customer %1 was created by CRM and must be deleted from the CRM system', Rec."No.");
    end;
}
