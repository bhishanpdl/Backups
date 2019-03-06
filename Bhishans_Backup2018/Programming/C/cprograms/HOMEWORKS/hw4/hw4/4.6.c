/* Programmer	: Bhishan Poudel
 * Question  	: hw 4.6 
 *Topic		: DVD and Music CD collections program
 
 DVD and Music CD collections program: Each of these have common fields like:
 Title, Studio/Production, length of play in minutes, barcode and price.
 
  However, music CD has Artists name and DVD movies have the leading Actor's name. 
  Implement sort as well as search features for the audio/video collections.
 */
 
 #include<stdio.h>
 #include<string.h>

//declarations of structures 
struct musiccd {
 	char		title[20];
 	char		singer[20];
 	double 		playlength;
 	double 		price;
 };
 
 typedef struct musiccd NAME1;
 NAME1	cd[10],temp1[10];

//structure for moviedvd 
struct moviedvd {
 	char		title[20];
 	char		director[20];
 	char		actor[20];
 	char		genre[20];
 	double 		rating;
 	double 		playlength;
 };
 typedef struct moviedvd NAME2;
 NAME2	dvd[10],temp2[10];
 

 //function prototype
 void display_music(int n);
 void display_movies(int p);
 void sort_title_music(int n);
 void sort_title_movies(int p);
 void search_music_title(int n);
 void search_movie_title(int p);
 
 
 // main function
 int main(){
printf("\n");

 	FILE *fp1;
 	fp1= fopen("music.txt", "r");
 	
 	FILE *fp2;
 	fp2= fopen("movies.txt", "r");
 	
 	int n=0;
 	int p=0;
 	int code;
 	
 	//storing input from music.txt
 	while(!feof(fp1)) 
	{
        	fscanf(fp1, " %s[^\n]",cd[n].title);
        	fscanf(fp1, " %s[^\n]",cd[n].singer);
        	fscanf(fp1, " %lf",&cd[n].playlength);
        	fscanf(fp1, " %lf",&cd[n].price);
	
		
        n= n+1;
	}	
    	n= n-1;
    
	fclose(fp1); 
	
	// storing input from movies.txt
	while(!feof(fp2)) 
	{
        	fscanf(fp2, " %s[^\n]",dvd[p].title);
        	fscanf(fp2, " %s[^\n]",dvd[p].director);
        	fscanf(fp2, " %s[^\n]",dvd[p].actor);
        	fscanf(fp2, " %s[^\n]",dvd[p].genre);
        	fscanf(fp2, " %lf",&dvd[p].rating);
        	fscanf(fp2, " %lf",&dvd[p].playlength);
	
		
        p= p+1;
	}	
    	p= p-1;
    
	fclose(fp2);
	
	//calling the functions
	display_music(n);
 	display_movies(p);
 	
 	printf("Menu:\n");
 	printf("1: sort movie by title\n");
 	printf("2: sort movie by title\n");
 	printf("3: search music by title\n");
 	printf("4: search movie by title\n");
 	printf("Enter the menu code : ==>  ");
 	scanf (" %d", &code);
 	
 	switch (code) {
 		case 1: sort_title_music(n);
 			break;
 		case 2:	sort_title_movies(p);
 			break;
 		case 3: search_music_title(n);
 			break;
 		case 4:	search_movie_title(p);
 			break;
 		default: printf("Invalid code!!\n");
 	}
 	
 printf("\n");
 
 return 0;
 }
 
 //function display_music
 void display_music(int n){
 
 	int k;
 	
        printf("\n\n*********************Music List*********************************************\n\n");
        printf("Title \t\tSinger    Playlength Price\n\n");
        
            for(k=0; k<n; k++)
            {
                printf("%-14s %-11s %.2f\t     %.2f\n",cd[k].title,cd[k].singer,cd[k].playlength,cd[k].price);
            }
        printf("\n******************************************************************************\n\n");
 
 }
  //function display_music
 void display_movies(int p){
 
 	int k;	// local variable
 	
        printf("\n*********************Movies List**********************************************\n\n");
        printf("Title \t\tDirector \t Actor\t\t     Genre\t       Rating Playlength\n\n");
        
            for(k=0; k<p; k++)
            {
            printf("%-14s %-17s %-20s %-16s\t %-4.2f\t %-4.0fmin\n",dvd[k].title,dvd[k].director,dvd[k].actor,dvd[k].genre,dvd[k].rating,dvd[k].playlength);
            }
        printf("\n******************************************************************************\n");
 
 }
 
//function sort_title_music
 void sort_title_music(int n)
 {
        NAME1	temp1;
        int 	i,j,k;        
         
        //sorting by title      
        for(i=0;i<n-1;i++){
        for (j=i+1;j<n;j++){			
            if (strcmp(cd[i].title,cd[j].title)>0){ 		
                temp1 	= cd[i];
                cd[i]	= cd[j];
                cd[j]	= temp1;
            }
        }
	}
	
	//displaying sorted data
	printf("\n\n*********************Sorted by Title of Music*********************************************\n\n");
        printf("Title \t\tSinger    Playlength Price\n\n");
        
            for(k=0; k<n; k++){
                printf("%-14s %-11s %.2f\t     %.2f\n",cd[k].title,cd[k].singer,cd[k].playlength,cd[k].price);
            }
}

//function sort_title_movies
 void sort_title_movies(int p)
 {
        NAME2	temp2;
        int 	i,j,k;        
         
        //sorting by title      
        for(i=0;i<p-1;i++){
        for (j=i+1;j<p;j++){			
            if (strcmp(dvd[i].title,dvd[j].title)>0){ 		
                temp2 	= dvd[i];
                dvd[i]	= dvd[j];
                dvd[j]	= temp2;
            }
        }
	}
	
	//displaying sorted data
	printf("\n\n*********************Sorted by Title of Movies*********************************************\n\n");
        printf("Title \t\tDirector \t Actor\t\t     Genre\t       Rating Playlength\n\n");
        
            for(k=0; k<p; k++)
            {
            printf("%-13s %-16s %-18s %-15s\t %-4.2f\t %-4.0fmin\n",dvd[k].title,dvd[k].director,dvd[k].actor,dvd[k].genre,dvd[k].rating,dvd[k].playlength);
            }
        printf("\n******************************************************************************\n");
}

// defining function search

void search_music_title(int n)
{
	int 	c = 0;		// counter
	char 	search[20];	// string to search
	char 	option;		// option y or n

        do{
        
        	printf("Enter the music title you want to search: =>  ");	
        	scanf("%s",search);
        	
        	int found=0;
        			
        	for (c=0;c<n;c++){		
        	
            		if(strcasecmp(cd[c].title,search)==0){		
            		
            			printf("The music %s is found on Position = %d\n", search,c+1);            			
            			printf("Do you want to search again (y/n)? => ");
            			scanf("\n%c", &option);
            			found++;
    			}
    					
    			
        	}
        	
        	if(found==0) {
                	printf("\nSorry, the search is not found!\n");
                	printf("Do you want to search again (y/n)? => ");
            		scanf("\n%c", &option);
            		
            	}		
    			
        	
        }
    	while((option == 'y' || option == 'Y') ); 
    	 	
}    	
//function  search_movie_title		
 void search_movie_title(int p)
{
	int 	c = 0;		// counter
	char 	search[20];	// string to search
	char 	option;		// option y or n

        do{
        
        	printf("Enter the music title you want to search: =>  ");	
        	scanf("%s",search);
        	
        	int found=0;
        			
        	for (c=0;c<p;c++){		
        	
            		if(strcasecmp(dvd[c].title,search)==0){		
            		
            			printf("The movie %s is found on Position = %d\n", search,c+1);            			
            			printf("Do you want to search again (y/n)? => ");
            			scanf("\n%c", &option);
            			found++;
    			}
    					
    			
        	}
        	
        	if(found==0) {
                	printf("\nSorry, the search is not found!\n");
                	printf("Do you want to search again (y/n)? => ");
            		scanf("\n%c", &option);
            		
            	}		
    			
        	
        }
    	while((option == 'y' || option == 'Y') ); 
    	 	
}    	
   	
