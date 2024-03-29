# Knowledge-Base Systems Lab, IIMAS UNAM 

## Requirements
A Prolog interpreter must be installed and working. For instance, SWI Prolog (see this [link](https://wwu-pi.github.io/tutorials/lectures/lsp/010_install_swi_prolog.html)). 

## Description of the KB System

**non-monotonic-KBS-for-DH** is a repository containing code and applications of a non-monotonic knowledge-base (KB) system featuring:
* strong negation, 
* negative and positive defaults,
* exceptions,
* multiple extensions,
* preference rules, 
* abductive reasoning, and
* an inference system.


The implementation for the previous capabilities is found in the Prolog file `kb_engine.pl` in the form of KB-Services. This file works as the engine of all the KB system.


There is an extensive number of KB-Services, the eight basic ones are listed next, where `KB` is a variable holding the knowledge-base of interest:
1. `class_extension(Class, KB, Extension)`: provides the set of individuals in the argument class.
1. `property_extension(Property, KB, Extension)`: provides the set of individuals that have the argument property.
1. `relation_extension(Relation, KB, Extension)`: provides the set of individuals that stand as subjects in the argument relation.
1. `explanation_extension(Property/Relation, KB, Extension)`: provides the set of individuals with an explanation supporting why such individuals have the argument property/relation.
1. `classes_of_individual(Argument, KB, Extension)`: provides the set of mother classes of the argument individual.
1. `properties_of_individual(Argument, KB, Extension)`: provides the set of properties of the argument individual.
1. `relations_of_individual(Argument, KB, Extension)`: provides the set of relations in which the argument individual stands as subject.
1. `explanation_of_individual(small Argument, KB, Extension)`: provides the supporting explanations of the conditional  properties and relations that the individual has.

Besides the KB-Services in `kb_engine.pl`, the user can type its own custom services or queries that retrieve specific information from the KB of the problem being faced. It is preferable to write the code for such custom queries in a different Prolog file and then load it as part of the KB system session.

In this repository two applications of the KB system are provided. First, a simple representation and manipulation of classes and individuals within a *university* is studied [here](https://github.com/KBS-Lab-IIMAS-UNAM/non-monotonic-KBS-for-DH/tree/master/university_taxonomy). Finally, the classification and management of knowledge regarding several aspects of *Astronomical Images of New Spain* is presented [here](https://github.com/KBS-Lab-IIMAS-UNAM/non-monotonic-KBS-for-DH/tree/master/ains_taxonomy) as a practical and real use of this KB system in the area of Digital Humanities.
