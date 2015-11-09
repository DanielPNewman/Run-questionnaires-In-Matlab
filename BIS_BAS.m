
%%%%%%%%%%%%%%% BIS/BAS Scales - 20 item (updated with Heyms 2010) %%%%%%%%%%%% 


%NOTE: to terminate the questionnaire at any point, press "CTRL/C"


% Source: Carver, C. S., & White, T. L. (1994). Behavioral inhibition, behavioral activation, 
% and affective responses to impending reward and punishment: The BIS/BAS Scales. Journal of Personality and Social Psychology, 67, 319-333.

%%%% Scoring

% Likert scale 1 (strongly disagree) to 4 (strongly agree)
% (R) = reverse scored item (but enter exactly as entered – use SPSS syntax file to “correct”)
% BIS Scale :  items: 1, 5, 9, 13, 17 (reverse scored), 19, 20 (reverse scored)
% BAS Scales:
% Reward Responsiveness: items 2, 6, 10, 14, 18
% Fun Seeking: items 4, 8, 12, 16,
% Drive: 3, 7, 11, 15


clc
clear all

%----------- Inputs -----------

MIN = 1;
MAX = 4; %here input the min and max of your response scale

invalidInputMessage = ['Please enter a number between ', int2str(MIN), ' and ', int2str(MAX), ':  '];

questions = { ...
    '1. If I think something unpleasant is going to happen I usually get pretty "worked up"' ...
    '2.	When I get something I want, I feel excited and energised'...
    '3.	When I want something, I usually go all out to get it'...
    '4.	I will often do things for no other reason than that they might be fun'...
    '5.	I worry about making mistakes'...
    '6.	When I''m doing well at something, I love to keep at it'...
    '7.	I go out of my way to get things I want'...
    '8.	I crave excitement and new sensations'...
    '9.	Criticism or scolding hurts me quite a bit'...
    '10. When good things happen to me it affects me strongly'...
    '11. If I see a chance to get something I want, I move on it right away'...
    '12. I''m always willing to try something new if I think it will be fun'...
    '13. I feel pretty worried or upset when I think or know somebody is angry with me'...
    '14. It would excite me to win a contest'...
    '15. When I go after something I use a "no holds barred" approach'...
    '16. I often act on the spur of the moment'...
    '17. Even if something bad is about to happen to me, I rarely experience fear or nervousness'... %Reverse Scored
    '18. When I see an opportunity for something I like, I get excited right away'...
    '19. I feel worried when I think I have done poorly at something'...
    '20. I have very few fears compared to my friends '}; %Reverse Scored

scale = '(1) Strongly Disagree\n(2) Disagree\n(3) Agree\n(4) Strongly Agree\n'; %here input the response options that the participant sees

%------------------------------

participantIdentifier = inputdlg('Enter SUBJECT/RUN/TASK IDENTIFIER');

answers = zeros(1,length(questions));

currentQuestion = 1;

fprintf('\n\n');
fprintf('Read each of the following statements carefully and use the number pad on the keyboard to indicate how strongly\nyou think each of them, in general, best describes you.')
fprintf('\nAfter ensuring you have selected the appropriate response using the number pad on the keyboard, please press "enter".')
fprintf('\n\n');
fprintf('\n\n');

while currentQuestion <= length(questions)
    
    inputValid = false;
    
    while not(inputValid)

        fprintf(char(questions(currentQuestion)));
        fprintf('\n');
        fprintf(scale);

        strResponse = input('', 's');

        try
            value = validateNumericalInput(strResponse, MIN, MAX);
        catch err
            fprintf('\n\n');
            fprintf(invalidInputMessage);
            fprintf('\n\n');
            continue
        end
        
        inputValid = true;
        
    end
    
    answers(currentQuestion) = value;
    
    fprintf('\n\n');
    
    currentQuestion = currentQuestion + 1;
end


savefilename = [char(participantIdentifier) '_BISBAS']; %here input the name of the questionnair to be appended onto the end of the saved data file name
save(savefilename, 'answers');




%%%%%%%%%%%%%%%%%%%%% SPSS scoring syntax %%%%%%%%%%%%%%%%%%%%%

% Label vars as bisbasx where x = item number e.g., item 1 var is labelled bisbas1
% 
% Enter raw data in SPSS exactly as answered by respondents, then use the following syntax to score scales:
% 
% COMPUTE bis = sum(bisbas1,bisbas5,bisbas9,bisbas13,(5-bisbas17),bisbas19,(5 -bisbas20)) .
% VARIABLE LABELS bis 'Carver & White BIS'.
% EXECUTE .
% COMPUTE bas_rr = SUM(bisbas2,bisbas6,bisbas10,bisbas14,bisbas18) .
% VARIABLE LABELS bas_rr 'Carver & White BAS Reward Responsiveness'.
% EXECUTE .
% COMPUTE bas_drv = SUM(bisbas3,bisbas7,bisbas11,bisbas15) .
% VARIABLE LABELS bas_drv 'Carver & White BAS Drive'.
% EXECUTE .
% COMPUTE bas_fs = SUM(bisbas4,bisbas8,bisbas12,bisbas16) .
% VARIABLE LABELS bas_fs 'Carver & White BAS Funseeking'.
% EXECUTE .
% 
% Note. Do not reverse items 17 and 20 prior to SPSS entry. 
% 
% Reliability
% 
% COMPUTE bisbas17r=5-BISBAS17.
% EXECUTE.
% COMPUTE bisbas20r=5-BISBAS20.
% EXECUTE.
% 
% RELIABILITY
%   /VARIABLES=bisbas1 bisbas5 bisbas9 bisbas13 bisbas17r bisbas19 bisbas20r
%   /FORMAT=NOLABELS
%   /SCALE(‘BIS’)=ALL/MODEL=ALPHA
%   /STATISTICS=SCALE
%   /SUMMARY=TOTAL .
% RELIABILITY
%   /VARIABLES=bisbas2 bisbas6 bisbas10 bisbas14 bisbas18
%   /FORMAT=NOLABELS
%   /SCALE(‘BAS RR’)=ALL/MODEL=ALPHA
%   /STATISTICS=SCALE
%   /SUMMARY=TOTAL .
% RELIABILITY
%   /VARIABLES=bisbas3 bisbas7 bisbas11 bisbas15
%   /FORMAT=NOLABELS
%   /SCALE(‘BAS Drv’)=ALL/MODEL=ALPHA
%   /STATISTICS=SCALE
%   /SUMMARY=TOTAL .
% RELIABILITY
%   /VARIABLES=bisbas4 bisbas8 bisbas12 bisbas16
%   /FORMAT=NOLABELS
%   /SCALE(‘BAS FS’)=ALL/MODEL=ALPHA
%   /STATISTICS=SCALE
%   /SUMMARY=TOT
% 
% 
% Note. With the revised theory a number of researchers have investigated re-scoring the BIS scale into two factors reflecting BIS-Anx and FFFS_Fear. The key reference is:
% 
% Heym, N., Ferguson, E., & Lawrence, C. (2008). An evaluation of the relationship between Gray's revised RST and Eysenck's PEN: Distinguishing BIS and FFFS in Carver and White's BIS/BAS scales. Personality and Individual Differences, 45(8), 709-715.
% 
% The scoring syntax is below. There have been no further studies validating this breakdown as of March 2010.
% 
% 
% **************Compute Heym's version of BIS scale into 2 facets- BIS-Anx and FFFS_Fear
% 
% COMPUTE BIS_Anx = sum(bisbas5,bisbas9,bisbas13,bisbas19) .
% VARIABLE LABELS BIS_Anx 'Heyms BIS Anx'.
% EXECUTE .
% 
% COMPUTE FFFS_Fear = sum(bisbas1,(5-bisbas17),(5 -bisbas20)) .
% VARIABLE LABELS FFFS_Fear 'Heyms FFFS_Fear'.
% EXECUTE .
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

