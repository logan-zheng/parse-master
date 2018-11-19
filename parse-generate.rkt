#lang plai
(require srfi/25)
;;We will use the srfi package for multidimensional arrays, it acts much like the vector package and we can use make-array and array-set! for mutable arrays
;;We can make our parse tables using this
(require typed-stack)
;;This is a stack library we might want to use to implement our stack




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




;;-----------------------------------------BUILD TABLES AND STATES--------------------------------
;;We will put our table-building code here: Initializing and populating the tables
;;(1)In order to build the tables, we need to first generate the set of configurating sets and successors that this language requires
;;(2)We then build the action and goto tables of the correct dimensions, and populate them with the states we have generated
;;(3)We ALSO need to write the lookback edges, essentially a form of mutable state? where we can look back in time to see how we have attained certain states (this is the part that makes LALR possible)
;;This can be implemented perhaps just using vector or cons-list the way we have implemented state in class
;;(4)We also need to write the accessors for the tables that our stack can call.  Say, given a certain state on the class, we can call (get-action current-state lookback-state lookahead-state) with arguments current-state,
;;lookback-state and lookahead state, and the function get-action will return the result of applying this to the action table so the stack knows what to do next.  This will need to be exported as part of the parser though....so
;;we need to figure out how to do that




;;----------------------------------------EXPORT--------------------------------------------------
;We will probably want to have a way to export the parser and the tables we have generated to an external file so this generator will only
;need to be run once for any new language.  The exported parser should only have the stack implementation, lexical analyser and input/output, and the tables can be written to their own file and imported in the parser