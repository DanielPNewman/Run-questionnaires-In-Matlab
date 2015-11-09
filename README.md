# Run questionnaires In Matlab

I made a script to administer Likert scale/multi-choice type questionnaires using matlab (so doesn't require internet connection in the EEG lab). Couldn't find any suitable and free tool to do this job that didn't require internet connection, so I wrote this.  See attached. In this case it is the BIS/BAS questionnaire, but it can be easily adapted for any multi-choice/scale type questionnaire.    To run it just maximize the matlab command window to full screen, type in the questionnaire name (i.e. BIS_BAS), and the questionnaire is administered.  When finished, the participants’ answers are automatically saved with participant number and questionnaire name (e.g. Dan1_BISBAS.mat). It calls the validateNumericalInput.m function (see attached) to insure the participant is entering the correct input, so you'd just need to put that file in the same matlab directory.

enjoy :)
