### Astronomical Images of New Spain

The structure for the initial taxonomy corresponding to `kb_ains_initial.txt` is depicted next:

![Initial taxonoty](img/initial_taxonomy_ains.jpg)

The session start by calling the Prolog interpreter with the instruction `swipl` in a terminal opened in this project folder `KBS-Lab-IIMAS-UNAM/non-monotonic-KBS-for-DH/`. The KB engine is loaded with the command:

```?- consult('../kb_engine.pl').```

**Note**: In the example code shown here there is a line break between each KB-Service call, which should not be present in the actual execution.

With the sequence of KB-Services presented below the `kb_ains_initial.txt` is updated by adding the image `selenografia_alzate_palafoxiana` with its id, its collector and the fact that it comes illuminated. Also the class `places`  is added with `salon_en_donceles` as its individual. And the id of `selenografia_alzate_jcb` is ammended. Note how each modification is saved in a variable holding the current state of the KB. Finally, then updated KB is saved as `kb_ains_initial_2.txt`. 

`?-open_kb('kb_ains_initial.txt',KB),`<br />
`add_object(selenografia_alzate_palafoxiana,images,KB,KB1),`
`add_object_property(selenografia_alzate_palafoxiana,illuminated,yes,KB1,KB2),`
`add_object_relation(selenografia_alzate_palafoxiana,collector,lafragua,KB2,KB3),`
`add_class(places,objects,KB3,KB4),add_object(salon_en_donceles,places,KB4,KB5),`
`add_object_property(salon_en_donceles,used_as,salon,KB5,KB6),`
`add_object_property(salon_en_donceles,location,'calle donceles',KB6,KB7),`
`change_value_object_property(selenografia_alzate_jcb,identifier,'B770.A478e',KB7,KB8),`
`save_kb('kb_ains_initial_2.txt',KB8).`

Some of the images described in this case-study can be found at [http://turing.iimas.unam.mx/ains/](http://turing.iimas.unam.mx/ains/)
