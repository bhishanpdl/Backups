            //Clothing sizes
            #include<stdio.h>
            double hat_size(double h,double w);
            double jacket_size(double h,double w,int age);
            double waist(double w,int age);

            int main()
            {
            double h,w;
            char code;
            int age;

           // printf("Enter how many time you want to compute you size:\n");
           // scanf("%d",&n);

            do
            {

            printf("Enter your height in inches:\n");
            scanf("%lf",&h);

            printf("Enter your weight in pounds:\n");
            scanf("%lf",&w);


            printf("Enter your age:\n");S
            scanf("%d",&age);


            printf("The Hat Size is %.2f\n",hat_size(h,w));

            printf("The Jacket Size is %.2f\n",jacket_size(h,w,age));

            printf("The Waist in inches is %.2f\n",waist(w,age));
            printf("Do you want to continue?(y/n)");
            scanf("\n%c",&code);

            }while (code=='y' || code =='Y');
            return 0;
            }

            //******************************************

            double hat_size(double h,double w)
            {

            double hat;

            hat=(h/w)*2.9;
            return(hat);
            }

            //*******************************************

            double jacket_size(double h,double w,int age)
            {
            double js;
            if(age>30)

            js=((h*w)/288.0)+(1.0/8.0)*((age-30)/10);

            else
            js=((h*w)/288.0);


            return (js);
            }
        //**************************************
            double waist(double w,int age)
            {
                double waist;
            if(age>28)

            waist=(w/5.7)+((age-28)/2)*(1.0/10.0);
            else
            waist=(w/5.7);

            return (waist);
            }





