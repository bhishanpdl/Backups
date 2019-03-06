// qn2.c classify the books Bhishan Poudel CS 5900 Midterm

# include<stdio.h>

int main()
{

	int choice;

	printf("Instructions: \n");
	printf("Please enter the following numbers for the subjects\n");
	printf("physics=1, chemistry=2, biology=3, zoology=4\n");
	printf("electrical=5, mechanical=6, civil=7\n");
	printf("finance=8,accounting=9\n");
	printf("leisure reading=10, story=11, comics=12\n");
	printf("If you want any other subject enter 0\n");
	scanf ("%d" , & choice);
	
	switch (choice)
	{
	case (1):
	case (2):
	case (3):
	case (4):
		printf("Your subject classification is Science\n");
		break;
	case (5):
	case (6):
	case (7):
	
		printf("Your subject classification is Engineering\n");
		break;
	case (8):
	case (9):
	
		printf("Your subject classification is Business\n");
		break;
	case (10):
	case (11):
	case (12):
	
		printf("Your subject classification is General\n");
		break;

	default:
	
		printf("At the moment, Cannot Classify!!\n");
		break;
	}

return 0;
}
