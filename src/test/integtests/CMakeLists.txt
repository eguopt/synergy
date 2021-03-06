# synergy -- mouse and keyboard sharing utility
# Copyright (C) 2009 Chris Schoeneman, Nick Bolton, Sorin Sbarnea
# 
# This package is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# found in the file COPYING that should have accompanied this file.
# 
# This package is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

set(src
	Main.cpp
)

if (WIN32)
	
	# windows
	list(APPEND src
		platform/CMSWindowsClipboardTests.cpp
	)

elseif (APPLE)

	# mac
	list(APPEND src
		platform/COSXClipboardTests.cpp
	)

elseif (UNIX)

	# unix/linux
	list(APPEND src
		platform/CXWindowsClipboardTests.cpp
	)

endif()

set(inc
	../../lib/arch
	../../lib/base
	../../lib/client
	../../lib/common
	../../lib/io
	../../lib/mt
	../../lib/net
	../../lib/platform
	../../lib/synergy
	../../../tools/gtest-1.6.0/include
	../../../tools/gmock-1.6.0/include
)

if (UNIX)
	list(APPEND inc
		../../..
	)
endif()

include_directories(${inc})
add_executable(integtests ${src})
target_link_libraries(integtests
	arch base client common io mt net platform server synergy gtest gmock ${libs})
