// ONLY use for PRINTING 
const char* Security_Levels_Strings[] = {"Black Ops", "Top Secret", "Secret", "Non Secret"}; 
 
 
int 
main() 
{ 
  Security_Levels s[4]; 
 
  s[0] = black_ops; 
  s[1] = top_secret; 
  s[2] = secret; 
  s[3] = non_secret; 
 
 
  printf("If enumerated types were integers they would be: \n"); 
 
  printf("\t%d %d %d %d \n\n", black_ops, top_secret, secret, non_secret ); 
 
  printf("Thus the array would contain: \n\t"); 
 
  for (int i=0; i<4; i++) 
    { 
      printf( "%d ", s[i] ); 
    } 
  printf("\n\n"); 
 
 
  printf("To access the strings directly we can use:\n"); 
 
  printf("\tSecurity_Levels_Strings[0] is : '%s'\n", Security_Levels_Strings[0]); 
  printf("\tSecurity_Levels_Strings[1] is : '%s'\n", Security_Levels_Strings[1]); 
  printf("\tSecurity_Levels_Strings[2] is : '%s'\n", Security_Levels_Strings[2]); 
  printf("\tSecurity_Levels_Strings[3] is : '%s'\n", Security_Levels_Strings[3]); 
 
  printf("OR:\n"); 
 
  printf("\tSecurity_Levels_Strings[ black_ops ]  is : '%s'\n", Security_Levels_Strings[black_ops]); 
  printf("\tSecurity_Levels_Strings[ top_secret ] is : '%s'\n", Security_Levels_Strings[top_secret]); 
  printf("\tSecurity_Levels_Strings[ secret ]     is : '%s'\n", Security_Levels_Strings[secret]); 
  printf("\tSecurity_Levels_Strings[ non_secret]  is : '%s'\n", Security_Levels_Strings[non_secret]); 
 
 
  printf("\nFinally, to get the strings associated with the stored values in our array we write:\n"); 
 
  for (int i=0; i<4; i++) 
    { 
      printf( "Security_Levels_Strings[s[%d]], which is '%s'\n", i, Security_Levels_Strings[s[i]] ); 
    } 
 
  return 0; 
 
} 
