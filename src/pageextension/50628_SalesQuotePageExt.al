pageextension 50628 "Sales Quote Page Ext" extends "Sales Quote"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Created by CRM"; Rec."Created by CRM")
            {
                ApplicationArea = All;
                Importance = Standard;
                ToolTip = 'Specifies whether this customer was created by CRM.';
                Editable = false; // Lock so it only can be changed by API
            }
            field("Synchronise"; Rec.Synchronise)
            {
                Caption = 'Synchronise with CRM';
                ApplicationArea = All;
                Importance = Standard;
                ToolTip = 'Specifies if this customer will be synchronised with the CRM system.';
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
            // Sychronise Field moved to top of page to make it more visible and accessible for users. 
            /*
                        group("CRM Integration")
                        {
                            Caption = 'CRM Integration';

                        }
            */
        }
    }
}
