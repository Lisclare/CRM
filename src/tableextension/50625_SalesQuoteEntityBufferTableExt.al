tableextension 50625 "Sales Quote Entity Buffer Ext" extends "Sales Quote Entity Buffer"
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
        field(50622; "CRM Subject"; Text[255])
        {
            Caption = 'CRM Subject';
            DataClassification = CustomerContent;
        }
    }
}
