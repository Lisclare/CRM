pageextension 50625 "Vendor Card Page Ext" extends "Vendor Card"
{
    layout
    {
        addlast(General)
        {
            field("Synchronize"; Rec.Synchronize)
            {
                ApplicationArea = All;
                Importance = Additional;
                ToolTip = 'Specifies whether to synchronize this vendor to CRM.';
            }
        }
    }
}
