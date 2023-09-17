WX_CONFIG := wx-config
WX_CXXFLAGS := $(shell $(WX_CONFIG) --cxxflags)
WX_LIBS := $(shell $(WX_CONFIG) --libs)

APPLICATION := myApplicaton
OBJECTS := MainFrame.o App.o

all: $(APPLICATION)

$(APPLICATION): $(OBJECTS)
	$(CXX) -o $@ $(OBJECTS) $(LDFLAGS) $(WX_LIBS) $(LIBS)

$(OBJECTS): %.o: %.cpp
	$(CXX) -c -o $@ $(WX_CXXFLAGS) $(CXXFLAGS) $<

.PHONY: clean
clean:
	find . -name '*~' -o -name '*.o' -o -name $(APPLICATION) | xargs rm


_______________________________________________________________________________
WX_CONFIG := wx-config
WX_CXXFLAGS := $(shell $(WX_CONFIG) --cxxflags)
WX_LIBS := $(shell $(WX_CONFIG) --libs)
SQLITE := -lsqlite3

APPLICATION := cashRegister
TESTS := taxCalculation_test
TESTS_OBJECTS := $(addsuffix .o,TESTS)
APPLICATION_OBJECTS:= MainFrame.o App.o SQLiteDB.o TaxCalculation.o
OBJECTS := $(APPLICATION_OBJECTS) catch_amalgamated.o

all: $(APPLICATION) $(TESTS)

$(APPLICATION): $(APPLICATION_OBJECTS)
	$(CXX) -o $@ $(APPLICATION_OBJECTS) $(LDFLAGS) $(WX_LIBS) $(LIBS) $(SQLITE)

$(OBJECTS): %.o: %.cpp %.hpp
	$(CXX) -c -o $@ $(WX_CXXFLAGS) $(CXXFLAGS) $<

$(TESTS_OBJECTS): %.o: %.cpp
	$(CXX) -c -o $@ $(WX_CXXFLAGS) $(CXXFLAGS) $<

# missing dependency issue
taxCalculation_test: taxCalculation_test.o TaxCalculation.o catch_amalgamated.o
	$(CXX) -o $@ $(LDFLAGS) $^

.PHONY: clean
clean:
	find . -name '*~' -o -name '*.o' -o -name $(APPLICATION) | xargs rm

_______________________________________________________________________________________

cmake_minimum_required(VERSION 3.18)
project(mythical_game VERSION 1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wconversion")

include(CTest)

set(CPP_SRCS  # all non-main source files
  unit.cpp
  weapon.cpp
)

add_executable(${PROJECT_NAME} main.cpp ${CPP_SRCS})
add_library(catch2 catch_amalgamated.cpp)

foreach(sourcefile ${CPP_SRCS})
  string(REPLACE ".cpp" "_test.cpp" testfile ${sourcefile})
  string(REPLACE ".cpp" "" testexecutable ${testfile})
  message(STATUS "${sourcefile} + ${testfile} => ${testexecutable}")
  add_executable(${testexecutable} ${sourcefile} ${testfile})
  target_link_libraries(${testexecutable} catch2)
  add_test(NAME ${testexecutable}
           COMMAND ${testexecutable})
endforeach()


