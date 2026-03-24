table 50629 "Debug Log"
{
    Caption = 'Debug Log';
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "LogTimestamp"; DateTime)
        {
            Caption = 'Timestamp';
        }
        field(3; "Message"; Text[250])
        {
            Caption = 'Message';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}