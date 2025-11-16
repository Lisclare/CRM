page 50622 "Ownership List"
{
    Caption = 'Ownership List';
    PageType = List;
    SourceTable = Ownership;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec."Description")
                {
                    ApplicationArea = All;
                }
                field("CRM ID"; Rec."CRM ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
