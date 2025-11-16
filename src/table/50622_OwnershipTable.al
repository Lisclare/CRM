table 50622 "Ownership"
{
    Caption = 'Ownership';
    DataClassification = CustomerContent;
    LookupPageId = "Ownership List";
    DrillDownPageId = "Ownership List";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
            NotBlank = true;
        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(3; "CRM ID"; Text[50])
        {
            Caption = 'CRM ID';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }
}
