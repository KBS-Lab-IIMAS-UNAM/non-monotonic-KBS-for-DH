### University Taxonomy

The initial taxonomy of a university is specified in `kb_university.txt`. Its structure is depicted next:

![Academic taxonomy](img/academic-taxonomy-2.png)

The session starts by calling the Prolog interpreter with the instruction `swipl` in a terminal opened in this project folder `non-monotonic-KBS-for-DH/university_taxonomy/`. The KB engine is loaded with the command:

```?- consult('../kb_engine.pl').```

---
**Note**: In the example code shown here there is a line break between each KB-Service call, which should not be present in the actual execution.

Examples are provided for each of the eight basic KB-Services present in the system.

1. Return the extension of a class:

`?- open_kb('kb_university.txt',KB),`<br />
   `class_extension(abstract,KB,Extension_Class).`
   
**Answer:** `Extension_Clas = [prog,ai].`

(i.e., all individuals within the class *abstract*).

2. Return the extension of a property:

`?- open_kb('kb_university.txt',KB),`<br />
   `property_extension(study,KB,Extension_Property).`
   
**Answer:** `Extension_Property = = [pete:uk,anne:mexico].`

(i.e., all individuals that have the property *study*).

3. Return the extension of a relation:

`?- open_kb('kb_university.txt',KB),`<br />
   `relation_extension(lectures,KB,Extension_Relation).`

**Answer:** `Extension_Relation = [mary:[ai],tom:[prog]].`

(i.e., all individuals that are related to *lectures*).

4. Return the extension of an explanation:

`?- open_kb('kb_university.txt',KB),`<br />
   `explanation_extension(study=>uk,KB,Extension_Explanation).`
   
   
**Answer:** `Extension_Explanation = [pete:(work=>uk)].`

(i.e., all individuals that have the property *study=>uk*).

5. Return the classes of an individual:

`?- open_kb('kb_university.txt',KB),`<br />
   `classes_of_individual(mary,KB,Classes_of).`
   
**Answer:** `Classes_of = ['faculty members',people,concrete,objects,top].`

(i.e., all classes of  *mary*).

6. Return the properties of an individual:

`?- open_kb('kb_university.txt',KB),`<br />
   `properties_of_individual(tom,KB,Properties_Of).`
   
**Answer:** `Properties_of = [sport,size=>short,fun,not(teach)].`

(i.e., all properties of  *tom*).

7. Return the relations of an individual:

`?- open_kb('kb_university.txt',KB),`<br />
   `relations_of_individual(pete,KB,Relations_Of).`

**Answer:** `Relations_Of = [enrolled=>[ai]].`

(i.e., all relations of  *pete*).

8. Return the explanations of an individual:

`?- open_kb('kb_university.txt',KB),`<br />
  `explanation_of_individual(anne,KB,Explanation_Of).`

**Answer:** `Explanation_Of = [(study=>mexico):(work=>mexico)].`

(i.e., all explanations of  *anne*).

---

