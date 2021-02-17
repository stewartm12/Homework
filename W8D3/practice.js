function mysteryScoping1() {
  var x = 'out of my block';

  if (true) {
    var x = 'in block';
    console.log(x);
  }

  console.log(x)
}

// mysteryScoping1();

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping2();

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping3();

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  console.log(x);
}

// mysteryScoping4();

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';  
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// mysteryScoping5();

function madLib(verb, adj, noun) {
  let sentence = `We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`
  console.log(sentence)
}

// madLib('make', 'best', 'guac');

function isSubString(searchString, subString) {
  return searchString.includes(subString);
}

// console.log(isSubString("Jump for joy", "joys"));

function fizzBuzz(array) {
  let fizzArr = [];
  for (let num of array) {

    if (num % 3 === 0 && num % 5 === 0) {
      continue;
    } else if (num % 3 === 0) {
        fizzArr.push(num);
    } else if (num % 5 === 0) {
        fizzArr.push(num);
    } 
  }

  console.log(fizzArr);
}

// fizzBuzz([1, 2, 3, 4, 5, 15])

function isPrime(number) {
  if (number < 2) {
    return false;
  }

  for (let i = 2; i < number; i++) {
    if (number % i === 0) {
      return false ;
    }
  }

  return true;
}

// console.log(isPrime(1))

function sumOfNPrimes(num) {
  let sum = 0;
  let countPrimes = 0;
  let i = 2;

  while (countPrimes < num) {
    if (isPrime(i)) {
      sum += i;
      countPrimes++;
    }

    i++;
  }

  console.log(sum);
}

// sumOfNPrimes(1);