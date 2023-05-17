#include "App.hpp"
#include "MainFrame.hpp"

#include <wx/wx.h>


wxIMPLEMENT_APP(App);

  bool App::OnInit() {
  MainFrame* mainFrame = new MainFrame("myApplication");
  mainFrame->SetClientSize(340, 500); // Define size of the window
  mainFrame->Center();
  mainFrame->Show();
  return true;

  }
