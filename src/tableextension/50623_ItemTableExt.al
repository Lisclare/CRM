tableextension 50623 "Item Table Ext" extends Item
{
    fields
    {
        field(50620; "Synchronize"; Boolean)
        {
            Caption = 'Synchronize';
            DataClassification = CustomerContent;
            InitValue = false;
        }
    }
}
