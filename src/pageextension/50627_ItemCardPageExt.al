pageextension 50627 "Item Card Page Ext" extends "Item Card"
{
    layout
    {
        addlast(Item)
        {
            field("Synchronize"; Rec.Synchronize)
            {
                ApplicationArea = All;
                Importance = Additional;
                ToolTip = 'Specifies whether to synchronize this item to CRM.';
            }
        }
    }
}
