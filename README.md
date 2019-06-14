# Knowledge-Base Systems Lab, IIMAS UNAM 
**non-monotonic-KBS-for-DH** is a repository containing code and applications of a non-monotonic knowledge-base (KB) system featuring:
* strong negation, 
* negative and positive defaults,
* conditional defaults,
* multiple extensions, and
* an inference system through preferences and abduction.


The implementation for the previous capabilities is found in the Prolog file `kb_engine.pl` in the form of KB-Services. There is an extensive number of KB-Services, the eight basic ones are listed next:
1. `class_extension(Class, Extension)`: provides the set of individual in the argument class.
1. `property_extension(Property,Extension)`: provides the set of individuals that have the argument property.
1. `relation_extension(Relation, Extension)`: provides the set of individuals that stand as subjects in the argument relation.
1. `explanation_extension(Property/Relation, Extension)`: provides the set of individuals that have the argument property/relation with an explanation supporting that such individuals have such property/relation.
1. `classes_of_individual(Argument, Extension)`: provides the set of mother classes of the argument individual.
1. `properties_of_individual(Argument,Extension)`: provides the set of properties of the argument individual.
1. `relations_of_individual(Argument, Extension)`: provides the set of relations in which the argument individual stands as subject.
1. `explanation_of_individual(small Argument, Extension)`: provides the supporting explanations of the conditional  properties and relations that the individual has.

Besides the KB-Services in `kb_engine.pl`, the user can type its own custom services or queries that retrieve specific information from the KB of the problem he is facing.

In this repository two application of our KB system are provided. First, a repesentation of classes and individuals within a *university* is studied. Finally, the classification and management of knowledge regarding several aspects of the *Astronomical Images of New Spain* is presented as a practical and real use of our KB system in the Digital Humanities.
