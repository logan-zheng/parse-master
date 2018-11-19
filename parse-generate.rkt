#lang plai
(require srfi/25)
;;We will use the srfi package for multidimensional arrays, it acts much like the vector package and we can use make-array and array-set! for mutable arrays
;;We can make our parse tables using this




;;-----------------------------------------SETUP CONSTANTS/STRUCTS--------------------------------
;;We can initialize our constants, static structs, anything else of the sort here

;;We may need to initialize a global set of static constants
(define ...)


;;a bunch of methods here to define stack operations and behaviours...including shift and reduce
(define (setup-stack)
  ...)





;;-----------------------------------------PARSE EBNF---------------------------------------------
;;Here we can read input and parse the grammar specifications needed.  We will need the user to call a function from this section
;;with at least 3 inputs: the EBNF spec, a list of terminals (basically reserved symbols) and an error procedure (or maybe select an option from a list of error handling options)


;take in a grammar spec, a set of tokens, and a set of allowed terminals, and generate an intermediate grammar that can be directly used to compute follow sets, configurations, and ultimately parse tables
(define (generate-grammar grammar tokens terminals ...)
  ...)



;;-----------------------------------------BUILD TABLES AND STATES--------------------------------
;;We will put our table-building code here: Initializing and populating the tables
;;(1)In order to build the tables, we need to first generate the set of configurating sets and successors that this language requires
;;(2)We then build the action and goto tables of the correct dimensions, and populate them with the states we have generated
;;(3)We ALSO need to write the lookback edges, essentially a form of mutable state? where we can look back in time to see how we have attained certain states (this is the part that makes LALR possible)
;;This can be implemented perhaps just using vector or cons-list the way we have implemented state in class
;;(4)We also need to write the accessors for the tables that our stack can call.  Say, given a certain state on the class, we can call (get-action current-state lookback-state lookahead-state) with arguments current-state,
;;lookback-state and lookahead state, and the function get-action will return the result of applying this to the action table so the stack knows what to do next.  This will need to be exported as part of the parser though....so
;;we need to figure out how to do that





;Add a new action to the action table
;Will have to do on-the-fly table compression here, unless we want to go the route of building a bulky LR table and then compress statically...this is a design choice! 
(define (add-action state symbol nextAction)
  ...)


;Build our action table...if we are building our tables with on-the-fly compression, we might need to be careful with how we initialize the table structs....
(define (build-action-table ...)
  ...)


;Build our GoTo table....
(define (build-goto-table ...)
  ...)

;A function to be called when we add an action: searches for any sufficiently similar states such that we can merge states + compress table
(define (find-compressable ...)
  ...)


;;----------------------------------------EXPORT--------------------------------------------------
;We will probably want to have a way to export the parser and the tables we have generated to an external file so this generator will only
;need to be run once for any new language.  The exported parser should only have the stack implementation, lexical analyser and input/output, and the tables can be written to their own file and imported in the parser