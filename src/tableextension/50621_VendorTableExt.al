tableextension 50621 "Vendor Table Ext" extends Vendor
{
    fields
    {
        field(50620; "Synchronize"; Boolean)
        {
            Caption = 'Synchronize';
            DataClassification = AccountData;
            InitValue = false;
        }
    }
}
