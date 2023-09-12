#include <ncurses.h>
#include "test.h"
using namespace std;


int main()
{

	test();
	initscr();
	printw("Hello World");
	refresh();
	getch();
	endwin();

	return 0;
}

