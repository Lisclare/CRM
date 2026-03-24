tableextension 50623 "Item Table Ext" extends Item
{
    fields
    {
        field(50620; "Synchronise"; Boolean)
        {
            Caption = 'Synchronise';
            DataClassification = CustomerContent;
            InitValue = false;
        }
    }
}
