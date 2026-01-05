pageextension 50628 "Sales Quote Page Ext" extends "Sales Quote"
{
    layout
    {
        addafter(Status)
        {
            field("Created by CRM"; Rec."Created by CRM")
            {
                ApplicationArea = All;
                Importance = Standard;
                ToolTip = 'Specifies whether this customer was created by CRM.';
                Editable = false; // Lock so it only can be changed by API
            }
        }
        addafter("Work Description")
        {
            field("CRM Subject"; Rec."CRM Subject")
            {
                ApplicationArea = All;
                Importance = Standard;
                ToolTip = 'Specifies the subject of the CRM record associated with this sales quote.';
                Editable = true;
            }
        }

        addafter("Foreign Trade")
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
    }
}
