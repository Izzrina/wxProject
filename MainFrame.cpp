#include "MainFrame.hpp"

#include <wx/wx.h>
//#include <wx/spinctrl.h>

#include <iostream>
//#include <vector>
//#include <iomanip>
//#include <cmath>

//using std::cout;

// enum IDs {
// BUTTON_A = wxID_HIGHEST + 1,
//
// };

MainFrame::MainFrame(const wxString& title) : wxFrame(nullptr, wxID_ANY, title)
{
wxColor background(33, 33, 33, 0);
wxFont font(20, wxFONTFAMILY_DEFAULT, wxFONTSTYLE_NORMAL,
wxFONTWEIGHT_BOLD, false);

//this->SetBackgroundColour(background);
//this->SetFont(font);

wxPanel *panel = new wxPanel(this, wxID_ANY, wxDefaultPosition, wxDefaultSize, 0);
panel->SetBackgroundColour(background);

}
