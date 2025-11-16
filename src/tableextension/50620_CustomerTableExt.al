tableextension 50620 "Customer Table Ext" extends Customer
{
    fields
    {
        field(50620; "Synchronise"; Boolean)
        {
            Caption = 'Synchronise';
            DataClassification = CustomerContent;
            InitValue = false;
            Description = 'Indicates if the customer has been synchronized with the CRM system';
        }
        field(50621; "Created by CRM"; Boolean)
        {
            Caption = 'Created by CRM';
            DataClassification = CustomerContent;
            InitValue = false;
        }
        field(50622; "Ownership"; Code[10])
        {
            Caption = 'Ownership';
            DataClassification = CustomerContent;
            TableRelation = Ownership;
        }
        field(50623; "Industry"; Code[10])
        {
            Caption = 'Industry';
            DataClassification = CustomerContent;
            TableRelation = Industry;
        }
    }

    trigger OnDelete()
    begin
        if "Synchronise" then
            Error('Cannot delete Customer %1 because "Synchronise" is true', "No.");
    end;
}
