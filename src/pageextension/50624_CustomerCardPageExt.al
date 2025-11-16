pageextension 50624 "Customer Card Page Ext" extends "Customer Card"
{
    layout
    {
        addafter(Name)
        {
            field("Ownership"; Rec.Ownership)
            {
                ApplicationArea = All;
                Importance = Standard;
                ToolTip = 'Specifies the ownership type of this customer.';
            }
        }
        addbefore(Statistics)
        {
            group("CRM Integration")
            {
                Caption = 'CRM Integration';
                field("Industry"; Rec.Industry)
                {
                    ApplicationArea = All;
                    Importance = Promoted;
                    ToolTip = 'Specifies the industry type of this customer.';
                }
                field("Synchronise"; Rec.Synchronise)
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies if this customer has been synchronised with the CRM system.';
                }
                field("Created by CRM"; Rec."Created by CRM")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies whether this customer was created by CRM.';
                }
            }
        }
    }
}
