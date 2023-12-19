# scheme-memoization

Macros for [memoization](https://en.wikipedia.org/wiki/Memoization) implemented in R7RS Scheme. I made these to practice Scheme, but you might find them useful if your implementation doesn't an alternative.

## Usage

Using `define-memoized`

```scheme
(import (scheme base)
        (scheme write)
        (memo))

(define-memoized (fib n)
  (if (<= n 2)
      1
      (+ (fib (- n 2))
         (fib (- n 1)))))

(display (fib 50))
(newline)
```

Or you can use `memoized-lambda`

```scheme
(import (scheme base)
        (scheme write)
        (srfi 1)
        (memo))

(let ((divs (memoized-lambda (x)
              ;; find natural divisors of x
              (filter (lambda (n)
                        (= 0 (modulo x n)))
                      (iota x 1)))))
  (display (divs 24))
  (newline)
  (display (divs 54))
  (newline)
  (display (divs 24)) ;; won't be calculated again,
                      ;; just fetched from cache
  (newline))
```
