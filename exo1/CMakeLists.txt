cmake_minimum_required( VERSION 3.0 )
project( hello )
add_executable( hello hello.cpp )
install( TARGETS hello DESTINATION bin )
