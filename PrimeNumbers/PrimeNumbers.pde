
int max = 1000;

// loop through the numbers one by one
for (int a = 1; a <max; a++) 
{
  boolean isPrimeNumber = true;
  // check to see if the number is prime
  
  for (int b = 2; b < a; b++) {
    if (a % b == 0) {
      isPrimeNumber = false;
      break; // exit the inner for loop
    }
  }

  // print the number if prime
  if (isPrimeNumber) {
    System.out.print(a + ", ");
   }
}



