tableextension 50621 "Vendor Table Ext" extends Vendor
{
    fields
    {
        field(50620; "Synchronise"; Boolean)
        {
            Caption = 'Synchronise';
            DataClassification = AccountData;
            InitValue = false;
        }
    }
}
