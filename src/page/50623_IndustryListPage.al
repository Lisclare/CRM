page 50623 "Industry List"
{
    Caption = 'Industry List';
    PageType = List;
    SourceTable = Industry;
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
