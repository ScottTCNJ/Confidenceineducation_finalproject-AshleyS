# Confidenceineducation_finalproject-AshleyS
This is my final project for Sociology descriptive statistics course where I looked at individual's confidence in the educational system 
# **Instructions**
To access and utalize the script open the file "Scott-trust-education.R", which contains the code for my findings

# ** Data **
The reasearch question at hand was "How do subjective class identity, cognitive ability, and job satisfaction influence people’s confidence in the education system?" The dependent variable is confidence in the education system, measured using a three-category ordinal scale: “a great deal,” “only some,” or “hardly any.” Key independent variables include subjective class identity (how respondents view their own class position), work satisfaction (ranging from very satisfied to very dissatisfied), and vocabulary score (a proxy for cognitive ability). Additional controls include logged household income, degree type, number of children, and whether the respondent majored in a STEM field. These variables are grouped into three broader concepts: cognitive ability and job satisfaction, class identity and material outcomes, and background characteristics.

This project uses data from the 2022 General Social Survey (GSS), a nationally representative survey of adults in the United States. The GSS gathers information on a wide array of topics, including attitudes toward institutions, work, social class, and education. For this study, relevant variables were selected based on the theoretical framework, centering on subjective class identity, cognitive ability, work satisfaction, and confidence in the education system. The sample was limited to respondents with complete data across all selected variables, resulting in an analytic sample of 799 individuals.

# ** Operationalization **
This study investigates how subjective class identity, cognitive ability, and job satisfaction influence individuals’ confidence in the education system. The dependent variable, confidence in education, was measured using an ordinal item from the 2022 General Social Survey, which asked respondents how much confidence they have in the educational system. Responses were categorized as “a great deal,” “only some,” or “hardly any.”

To measure cognitive ability and job satisfaction, I used two variables under the first conceptual group, Ability & Satisfaction. Vocabulary score was included as a proxy for cognitive ability, based on a standardized 10-item word test administered in the GSS. Work satisfaction was assessed using a Likert-scale question gauging how satisfied respondents are with their current job.

The second conceptual group, Class & Outcome, captured both subjective and objective aspects of class. Subjective class identity was measured through self-reported class status (e.g., working, middle, or upper class). Household income was included as a logged continuous variable to reflect economic resources and mitigate the effects of skewed income distributions.

Finally, the Background group controlled for structural and demographic factors. Educational attainment was represented by the highest degree earned. Number of children was included to account for family structure, and college major was categorized into STEM versus non-STEM fields to explore potential differences in institutional trust by area of study.

All variables were cleaned and recoded using R, and the resulting dataset was analyzed using ordinal logistic regression to test theoretical relationships between identity, ability, and institutional confidence.
