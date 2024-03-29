### Astronomical Images of New Spain (AINS)

The structure for the initial taxonomy corresponding to [`kb_ains_initial.txt`](https://github.com/KBS-Lab-IIMAS-UNAM/non-monotonic-KBS-for-DH/blob/master/ains_taxonomy/kb_ains_initial.txt) is depicted next:

![Initial taxonomy](img/initial_taxonomy_ains.jpg)

The session starts by calling the Prolog interpreter with the instruction `swipl` in a terminal opened at the location `non-monotonic-KBS-for-DH/ains_taxonomy/` of this project as the current working directory. Next, the KB engine is loaded with the command:

```?- consult('../kb_engine.pl').```

---
**Note**: In the example code shown here there is a line break between each KB-Service call, which should not be present in the actual execution.

With the sequence of KB-Services presented below the `kb_ains_initial.txt` is updated by adding the image `selenografia_alzate_palafoxiana` with its id, its collector and the fact that it comes illuminated. Also the class `places`  is added with `salon_en_donceles` as its individual. And the id of `selenografia_alzate_jcb` is ammended. Each KB-Service that is used to make modifications reads the source KB and outputs a second KB holding the changes that took place. Finally, the updated KB is saved as [`kb_ains_initial_2.txt`](https://github.com/KBS-Lab-IIMAS-UNAM/non-monotonic-KBS-for-DH/blob/master/ains_taxonomy/kb_ains_initial_2.txt):

`?- open_kb('kb_ains_initial.txt',KB),`<br />
`add_object(selenografia_alzate_palafoxiana,images,KB,KB1),`<br />
`add_object_property(selenografia_alzate_palafoxiana,illuminated,yes,KB1,KB2),`<br />
`add_object_relation(selenografia_alzate_palafoxiana,collector,lafragua,KB2,KB3),`<br />
`add_class(places,objects,KB3,KB4),add_object(salon_en_donceles,places,KB4,KB5),`<br />
`add_object_property(salon_en_donceles,used_as,salon,KB5,KB6),`<br />
`add_object_property(salon_en_donceles,location,'calle donceles',KB6,KB7),`<br />
`change_value_object_property(selenografia_alzate_jcb,identifier,'B770.A478e',KB7,KB8),`<br />
`save_kb('kb_ains_initial_2.txt',KB8).`

Next, the class `selenografia_alzate` is added to `kb_ains_initial_2.txt` and a reassignment of the objects in the class `images` takes place, ending up with the KB [`kb_ains_initial_3.txt`](https://github.com/KBS-Lab-IIMAS-UNAM/non-monotonic-KBS-for-DH/blob/master/ains_taxonomy/kb_ains_initial_3.txt). The following commands carry out these modifications:

`?- open_kb('kb_ains_initial_2.txt',KB),`<br />
`add_class(selenografia_alzate,images,KB,KB2),`<br />
`change_object_class(selenografia_alzate_palafoxiana, selenografia_alzate,KB2,KB3),`<br />
`change_object_class(selenografia_alzate_jcb,selenografia_alzate,KB3,KB4),`<br />
`save_kb('kb_ains_initial_3.txt',KB4).`

---
After all the research work is completed, the resulting KB for the case-study on Astronomical Images of New Spain can be seen at [`kb_ains_final.txt`](https://github.com/KBS-Lab-IIMAS-UNAM/non-monotonic-KBS-for-DH/blob/master/ains_taxonomy/kb_ains_final.txt), whose partial diagram appears below.

![Final taxonomy](img/final_taxonomy_ains.jpg)

---
Custom queries allow the retrival of specific information important for developers and final users of a particular KB application. In the current case-study, the custom queries for Astronomical Images of New Spain are defined in the file [`cust_queries_ains.pl`](https://github.com/KBS-Lab-IIMAS-UNAM/non-monotonic-KBS-for-DH/blob/master/ains_taxonomy/cust_queries_ains.pl). For instance, `extension_keyword` is a custom query that lists all images in the taxonomy sharing a *keyword*. The example code below is run in the ongoing session where the KB system is currently active:

`?- consult('cust_queries_ains.pl').`<br /><br />
`?- open_kb('kb_ains_final.txt',KB),`<br />
`extension_keyword(moon,KB,Extension).`

The answer with all images in the KB `kb_ains_final.txt` having the keyword `moon` is: 

`Extension = [selenografia_alzate, selenografia_oculus].`

---
Some of the images described in this case-study can be found at [http://turing.iimas.unam.mx/ains/](http://turing.iimas.unam.mx/ains/)
