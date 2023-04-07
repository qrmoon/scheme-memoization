(define-library (memo)
  (import (scheme base)
          (srfi 125))
  (export memoized-lambda
          define-memoized)
  (begin
    (define-syntax memoized-lambda
      (syntax-rules ()
        ((_ (args) . body)
         (let ((table (make-hash-table equal?)))
           (lambda (args)
             (if (hash-table-contains? table (list args))
                 (hash-table-ref table (list args))
                 (let ((res (begin . body)))
                   (hash-table-set! table (list args) res)
                   res)))))))

    (define-syntax define-memoized
      (syntax-rules ()
        ((_ (f . args) . body)
         (define f
           (memoized-lambda args
             . body)))))))
