import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_rw.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('rw')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'RealWorks EAP'**
  String get appTitle;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Your wellbeing, your growth'**
  String get onboardingTitle1;

  /// No description provided for @onboardingDescription1.
  ///
  /// In en, this message translates to:
  /// **'RealWorks EAP is your confidential partner in navigating life\'s challenges and fostering personal development.'**
  String get onboardingDescription1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Financial tools for your future'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDescription2.
  ///
  /// In en, this message translates to:
  /// **'Access resources to help you manage your finances, plan for the future, and achieve your financial goals with confidence.'**
  String get onboardingDescription2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Stay safe. Stay supported.'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDescription3.
  ///
  /// In en, this message translates to:
  /// **''**
  String get onboardingDescription3;

  /// No description provided for @onboardingSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboardingSkip;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @onboardingGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboardingGetStarted;

  /// No description provided for @splashBrandName.
  ///
  /// In en, this message translates to:
  /// **'RealWorks'**
  String get splashBrandName;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Employee Assistance Program'**
  String get splashTagline;

  /// No description provided for @signUpTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpTitle;

  /// No description provided for @signUpFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get signUpFullNameHint;

  /// No description provided for @signUpFullNameError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get signUpFullNameError;

  /// No description provided for @signUpEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get signUpEmailHint;

  /// No description provided for @signUpEmailErrorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get signUpEmailErrorEmpty;

  /// No description provided for @signUpEmailErrorInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get signUpEmailErrorInvalid;

  /// No description provided for @signUpPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'Phone Number (optional)'**
  String get signUpPhoneHint;

  /// No description provided for @signUpPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signUpPasswordHint;

  /// No description provided for @signUpPasswordErrorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter a password'**
  String get signUpPasswordErrorEmpty;

  /// No description provided for @signUpPasswordErrorLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get signUpPasswordErrorLength;

  /// No description provided for @signUpConfirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get signUpConfirmPasswordHint;

  /// No description provided for @signUpConfirmPasswordErrorMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get signUpConfirmPasswordErrorMismatch;

  /// No description provided for @signUpGenderHint.
  ///
  /// In en, this message translates to:
  /// **'Gender (optional)'**
  String get signUpGenderHint;

  /// No description provided for @signUpGenderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get signUpGenderMale;

  /// No description provided for @signUpGenderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get signUpGenderFemale;

  /// No description provided for @signUpGenderPreferNot.
  ///
  /// In en, this message translates to:
  /// **'Prefer not to say'**
  String get signUpGenderPreferNot;

  /// No description provided for @signUpAgeGroupHint.
  ///
  /// In en, this message translates to:
  /// **'Age Group (optional)'**
  String get signUpAgeGroupHint;

  /// No description provided for @signUpAgeGroupOption1824.
  ///
  /// In en, this message translates to:
  /// **'18-24'**
  String get signUpAgeGroupOption1824;

  /// No description provided for @signUpAgeGroupOption2534.
  ///
  /// In en, this message translates to:
  /// **'25-34'**
  String get signUpAgeGroupOption2534;

  /// No description provided for @signUpAgeGroupOption3544.
  ///
  /// In en, this message translates to:
  /// **'35-44'**
  String get signUpAgeGroupOption3544;

  /// No description provided for @signUpAgeGroupOption4554.
  ///
  /// In en, this message translates to:
  /// **'45-54'**
  String get signUpAgeGroupOption4554;

  /// No description provided for @signUpAgeGroupOption55Plus.
  ///
  /// In en, this message translates to:
  /// **'55+'**
  String get signUpAgeGroupOption55Plus;

  /// No description provided for @signUpOccupationHint.
  ///
  /// In en, this message translates to:
  /// **'Occupation / Worksite (optional)'**
  String get signUpOccupationHint;

  /// No description provided for @signUpOccupationSiteA.
  ///
  /// In en, this message translates to:
  /// **'Site A'**
  String get signUpOccupationSiteA;

  /// No description provided for @signUpOccupationSiteB.
  ///
  /// In en, this message translates to:
  /// **'Site B'**
  String get signUpOccupationSiteB;

  /// No description provided for @signUpOccupationOffice.
  ///
  /// In en, this message translates to:
  /// **'Office'**
  String get signUpOccupationOffice;

  /// No description provided for @signUpOccupationOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get signUpOccupationOther;

  /// No description provided for @signUpTermsPrefix.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get signUpTermsPrefix;

  /// No description provided for @signUpTermsLabel.
  ///
  /// In en, this message translates to:
  /// **'Terms'**
  String get signUpTermsLabel;

  /// No description provided for @signUpTermsConnector.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get signUpTermsConnector;

  /// No description provided for @signUpPrivacyLabel.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get signUpPrivacyLabel;

  /// No description provided for @signUpTermsSuffix.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get signUpTermsSuffix;

  /// No description provided for @signUpAcceptTermsError.
  ///
  /// In en, this message translates to:
  /// **'Please accept the terms and privacy policy'**
  String get signUpAcceptTermsError;

  /// No description provided for @signUpSubmitError.
  ///
  /// In en, this message translates to:
  /// **'Sign up failed. Please try again.'**
  String get signUpSubmitError;

  /// No description provided for @signUpButton.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpButton;

  /// No description provided for @signUpExistingAccountPrompt.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get signUpExistingAccountPrompt;

  /// No description provided for @signUpExistingAccountAction.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signUpExistingAccountAction;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInTitle;

  /// No description provided for @signInEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get signInEmailHint;

  /// No description provided for @signInEmailErrorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get signInEmailErrorEmpty;

  /// No description provided for @signInEmailErrorInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get signInEmailErrorInvalid;

  /// No description provided for @signInPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signInPasswordHint;

  /// No description provided for @signInPasswordErrorEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get signInPasswordErrorEmpty;

  /// No description provided for @signInForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get signInForgotPassword;

  /// No description provided for @signInButton.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInButton;

  /// No description provided for @signInInvalidCredentials.
  ///
  /// In en, this message translates to:
  /// **'Invalid email or password'**
  String get signInInvalidCredentials;

  /// No description provided for @signInNoAccountPrompt.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get signInNoAccountPrompt;

  /// No description provided for @signInNoAccountAction.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signInNoAccountAction;

  /// No description provided for @homeGreetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get homeGreetingMorning;

  /// No description provided for @homeGreetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get homeGreetingAfternoon;

  /// No description provided for @homeGreetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get homeGreetingEvening;

  /// No description provided for @homeGreetingSummary.
  ///
  /// In en, this message translates to:
  /// **'Here\'s your wellbeing summary'**
  String get homeGreetingSummary;

  /// No description provided for @homeWellbeingScoreTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Wellbeing Score'**
  String get homeWellbeingScoreTitle;

  /// No description provided for @homeWellbeingScoreValue.
  ///
  /// In en, this message translates to:
  /// **'78/100'**
  String get homeWellbeingScoreValue;

  /// No description provided for @homeWellbeingImprovement.
  ///
  /// In en, this message translates to:
  /// **'You\'ve improved by 5 points this week. Keep it up!'**
  String get homeWellbeingImprovement;

  /// No description provided for @homeQuickAccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick Access'**
  String get homeQuickAccessTitle;

  /// No description provided for @homeQuickAccessCounseling.
  ///
  /// In en, this message translates to:
  /// **'Counseling'**
  String get homeQuickAccessCounseling;

  /// No description provided for @homeQuickAccessFinancial.
  ///
  /// In en, this message translates to:
  /// **'Financial Literacy'**
  String get homeQuickAccessFinancial;

  /// No description provided for @homeQuickAccessLegal.
  ///
  /// In en, this message translates to:
  /// **'Legal Aid'**
  String get homeQuickAccessLegal;

  /// No description provided for @homeQuickAccessFitness.
  ///
  /// In en, this message translates to:
  /// **'Fitness'**
  String get homeQuickAccessFitness;

  /// No description provided for @homeQuickAccessNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get homeQuickAccessNutrition;

  /// No description provided for @homeQuickAccessMindfulness.
  ///
  /// In en, this message translates to:
  /// **'Mindfulness'**
  String get homeQuickAccessMindfulness;

  /// No description provided for @homeHighlightsTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Highlights'**
  String get homeHighlightsTitle;

  /// No description provided for @homeHighlightAppointmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Appointment with Dr. Evans'**
  String get homeHighlightAppointmentTitle;

  /// No description provided for @homeHighlightAppointmentSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Today, 2:00 PM'**
  String get homeHighlightAppointmentSubtitle;

  /// No description provided for @homeHighlightMindfulnessTitle.
  ///
  /// In en, this message translates to:
  /// **'10-minute mindfulness session'**
  String get homeHighlightMindfulnessTitle;

  /// No description provided for @homeHighlightMindfulnessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Complete your daily goal'**
  String get homeHighlightMindfulnessSubtitle;

  /// No description provided for @homeHighlightArticleTitle.
  ///
  /// In en, this message translates to:
  /// **'Read: Managing Work Stress'**
  String get homeHighlightArticleTitle;

  /// No description provided for @homeHighlightArticleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'New article available'**
  String get homeHighlightArticleSubtitle;

  /// No description provided for @budgetPlannerTitle.
  ///
  /// In en, this message translates to:
  /// **'Budget Planner'**
  String get budgetPlannerTitle;

  /// No description provided for @budgetTotalBalanceLabel.
  ///
  /// In en, this message translates to:
  /// **'Total Balance'**
  String get budgetTotalBalanceLabel;

  /// No description provided for @budgetTotalBalanceValue.
  ///
  /// In en, this message translates to:
  /// **'RWF 14,500,000'**
  String get budgetTotalBalanceValue;

  /// No description provided for @budgetGrowthLabel.
  ///
  /// In en, this message translates to:
  /// **'12.5% this month'**
  String get budgetGrowthLabel;

  /// No description provided for @budgetExpenseByCategoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Expense by Category'**
  String get budgetExpenseByCategoryTitle;

  /// No description provided for @budgetCategoryTotalLabel.
  ///
  /// In en, this message translates to:
  /// **'RWF 2,400,000'**
  String get budgetCategoryTotalLabel;

  /// No description provided for @budgetCategoryFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get budgetCategoryFood;

  /// No description provided for @budgetCategoryTransport.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get budgetCategoryTransport;

  /// No description provided for @budgetCategoryFamilySupport.
  ///
  /// In en, this message translates to:
  /// **'Family Support'**
  String get budgetCategoryFamilySupport;

  /// No description provided for @budgetCategoryFoodAmount.
  ///
  /// In en, this message translates to:
  /// **'RWF 1,440,000'**
  String get budgetCategoryFoodAmount;

  /// No description provided for @budgetCategoryTransportAmount.
  ///
  /// In en, this message translates to:
  /// **'RWF 607,500'**
  String get budgetCategoryTransportAmount;

  /// No description provided for @budgetCategoryFamilySupportAmount.
  ///
  /// In en, this message translates to:
  /// **'RWF 360,000'**
  String get budgetCategoryFamilySupportAmount;

  /// No description provided for @budgetAddTransaction.
  ///
  /// In en, this message translates to:
  /// **'Add Transaction'**
  String get budgetAddTransaction;

  /// No description provided for @counselingTitle.
  ///
  /// In en, this message translates to:
  /// **'Counseling & Support'**
  String get counselingTitle;

  /// No description provided for @counselingHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Professional Support'**
  String get counselingHeroTitle;

  /// No description provided for @counselingHeroDescription.
  ///
  /// In en, this message translates to:
  /// **'Connect with licensed counselors for mental health support, stress management, and personal guidance.'**
  String get counselingHeroDescription;

  /// No description provided for @counselingBookAppointment.
  ///
  /// In en, this message translates to:
  /// **'Book Appointment'**
  String get counselingBookAppointment;

  /// No description provided for @counselingSupportSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Support Categories'**
  String get counselingSupportSectionTitle;

  /// No description provided for @counselingSupportSectionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the area where you need help'**
  String get counselingSupportSectionSubtitle;

  /// No description provided for @counselingCategoryMentalHealthTitle.
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get counselingCategoryMentalHealthTitle;

  /// No description provided for @counselingCategoryMentalHealthDescription.
  ///
  /// In en, this message translates to:
  /// **'Depression, anxiety, and emotional support'**
  String get counselingCategoryMentalHealthDescription;

  /// No description provided for @counselingCategoryWorkStressTitle.
  ///
  /// In en, this message translates to:
  /// **'Work Stress'**
  String get counselingCategoryWorkStressTitle;

  /// No description provided for @counselingCategoryWorkStressDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage workplace pressure and burnout'**
  String get counselingCategoryWorkStressDescription;

  /// No description provided for @counselingCategorySrhTitle.
  ///
  /// In en, this message translates to:
  /// **'SRH & Family Planning'**
  String get counselingCategorySrhTitle;

  /// No description provided for @counselingCategorySrhDescription.
  ///
  /// In en, this message translates to:
  /// **'Reproductive health and family resources'**
  String get counselingCategorySrhDescription;

  /// No description provided for @counselingCategorySubstanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Substance Abuse'**
  String get counselingCategorySubstanceTitle;

  /// No description provided for @counselingCategorySubstanceDescription.
  ///
  /// In en, this message translates to:
  /// **'Recovery support and treatment guidance'**
  String get counselingCategorySubstanceDescription;

  /// No description provided for @counselingAvailableCounselorsTitle.
  ///
  /// In en, this message translates to:
  /// **'Available Counselors'**
  String get counselingAvailableCounselorsTitle;

  /// No description provided for @counselingSpecialtyClinicalPsychologist.
  ///
  /// In en, this message translates to:
  /// **'Clinical Psychologist'**
  String get counselingSpecialtyClinicalPsychologist;

  /// No description provided for @counselingSpecialtyFamilyTherapist.
  ///
  /// In en, this message translates to:
  /// **'Family Therapist'**
  String get counselingSpecialtyFamilyTherapist;

  /// No description provided for @counselingCounselorExperience.
  ///
  /// In en, this message translates to:
  /// **'{years} years experience'**
  String counselingCounselorExperience(Object years);

  /// No description provided for @counselingMoodTitle.
  ///
  /// In en, this message translates to:
  /// **'How are you feeling today?'**
  String get counselingMoodTitle;

  /// No description provided for @counselingMoodOptionStressedTitle.
  ///
  /// In en, this message translates to:
  /// **'Feeling Stressed?'**
  String get counselingMoodOptionStressedTitle;

  /// No description provided for @counselingMoodOptionStressedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s talk it through.'**
  String get counselingMoodOptionStressedSubtitle;

  /// No description provided for @counselingMoodOptionFinancialTitle.
  ///
  /// In en, this message translates to:
  /// **'Need Financial Advice?'**
  String get counselingMoodOptionFinancialTitle;

  /// No description provided for @counselingMoodOptionFinancialSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tips for managing your budget.'**
  String get counselingMoodOptionFinancialSubtitle;

  /// No description provided for @counselingMoodOptionLearnTitle.
  ///
  /// In en, this message translates to:
  /// **'Want to Learn Something New?'**
  String get counselingMoodOptionLearnTitle;

  /// No description provided for @counselingMoodOptionLearnSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore a new skill or topic.'**
  String get counselingMoodOptionLearnSubtitle;

  /// No description provided for @counselingMoodStartChat.
  ///
  /// In en, this message translates to:
  /// **'Start an Open Chat'**
  String get counselingMoodStartChat;

  /// No description provided for @emergencySupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Emergency Support'**
  String get emergencySupportTitle;

  /// No description provided for @emergencyBannerText.
  ///
  /// In en, this message translates to:
  /// **'If this is a life-threatening emergency, please call 911 immediately.'**
  String get emergencyBannerText;

  /// No description provided for @emergencyCrisisHotlinesTitle.
  ///
  /// In en, this message translates to:
  /// **'Crisis Hotlines'**
  String get emergencyCrisisHotlinesTitle;

  /// No description provided for @emergencyHotlineNationalTitle.
  ///
  /// In en, this message translates to:
  /// **'National Crisis Line'**
  String get emergencyHotlineNationalTitle;

  /// No description provided for @emergencyHotlineNationalDescription.
  ///
  /// In en, this message translates to:
  /// **'24/7 confidential support'**
  String get emergencyHotlineNationalDescription;

  /// No description provided for @emergencyHotlineMentalTitle.
  ///
  /// In en, this message translates to:
  /// **'Mental Health Support'**
  String get emergencyHotlineMentalTitle;

  /// No description provided for @emergencyHotlineMentalDescription.
  ///
  /// In en, this message translates to:
  /// **'Professional counseling available'**
  String get emergencyHotlineMentalDescription;

  /// No description provided for @emergencyHotlineSubstanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Substance Abuse Support'**
  String get emergencyHotlineSubstanceTitle;

  /// No description provided for @emergencyHotlineSubstanceDescription.
  ///
  /// In en, this message translates to:
  /// **'Free and confidential help'**
  String get emergencyHotlineSubstanceDescription;

  /// No description provided for @emergencyImmediateResourcesTitle.
  ///
  /// In en, this message translates to:
  /// **'Immediate Resources'**
  String get emergencyImmediateResourcesTitle;

  /// No description provided for @emergencyStartLiveChat.
  ///
  /// In en, this message translates to:
  /// **'Start Live Chat'**
  String get emergencyStartLiveChat;

  /// No description provided for @emergencyScheduleSession.
  ///
  /// In en, this message translates to:
  /// **'Schedule Emergency Session'**
  String get emergencyScheduleSession;

  /// No description provided for @emergencySelfHelpTitle.
  ///
  /// In en, this message translates to:
  /// **'Self-Help Resources'**
  String get emergencySelfHelpTitle;

  /// No description provided for @emergencyResourceBreathingTitle.
  ///
  /// In en, this message translates to:
  /// **'Breathing Exercises'**
  String get emergencyResourceBreathingTitle;

  /// No description provided for @emergencyResourceBreathingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Quick techniques to manage anxiety'**
  String get emergencyResourceBreathingSubtitle;

  /// No description provided for @emergencyResourceGroundingTitle.
  ///
  /// In en, this message translates to:
  /// **'Grounding Techniques'**
  String get emergencyResourceGroundingTitle;

  /// No description provided for @emergencyResourceGroundingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Stay present during difficult moments'**
  String get emergencyResourceGroundingSubtitle;

  /// No description provided for @emergencyResourceSafetyTitle.
  ///
  /// In en, this message translates to:
  /// **'Safety Planning'**
  String get emergencyResourceSafetyTitle;

  /// No description provided for @emergencyResourceSafetySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your personal crisis plan'**
  String get emergencyResourceSafetySubtitle;

  /// No description provided for @incomeSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Income Setup'**
  String get incomeSetupTitle;

  /// No description provided for @incomeSetupHeading.
  ///
  /// In en, this message translates to:
  /// **'Set up your income'**
  String get incomeSetupHeading;

  /// No description provided for @incomeSetupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help us understand your financial situation'**
  String get incomeSetupSubtitle;

  /// No description provided for @incomePrimarySourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Primary Income Source'**
  String get incomePrimarySourceLabel;

  /// No description provided for @incomeSourceSalary.
  ///
  /// In en, this message translates to:
  /// **'Salary'**
  String get incomeSourceSalary;

  /// No description provided for @incomeSourceBusiness.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get incomeSourceBusiness;

  /// No description provided for @incomeSourceFreelance.
  ///
  /// In en, this message translates to:
  /// **'Freelance'**
  String get incomeSourceFreelance;

  /// No description provided for @incomeSourcePension.
  ///
  /// In en, this message translates to:
  /// **'Pension'**
  String get incomeSourcePension;

  /// No description provided for @incomeSourceOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get incomeSourceOther;

  /// No description provided for @incomeAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Income Amount'**
  String get incomeAmountLabel;

  /// No description provided for @incomeAmountPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'RWF 5,000,000'**
  String get incomeAmountPlaceholder;

  /// No description provided for @incomeAmountValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter your income amount'**
  String get incomeAmountValidation;

  /// No description provided for @incomeFrequencyLabel.
  ///
  /// In en, this message translates to:
  /// **'Income Frequency'**
  String get incomeFrequencyLabel;

  /// No description provided for @incomeFrequencyWeekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get incomeFrequencyWeekly;

  /// No description provided for @incomeFrequencyBiWeekly.
  ///
  /// In en, this message translates to:
  /// **'Bi-weekly'**
  String get incomeFrequencyBiWeekly;

  /// No description provided for @incomeFrequencyMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get incomeFrequencyMonthly;

  /// No description provided for @incomeFrequencyAnnually.
  ///
  /// In en, this message translates to:
  /// **'Annually'**
  String get incomeFrequencyAnnually;

  /// No description provided for @incomeAdditionalLabel.
  ///
  /// In en, this message translates to:
  /// **'Additional Income (Optional)'**
  String get incomeAdditionalLabel;

  /// No description provided for @incomeAdditionalPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'RWF 0'**
  String get incomeAdditionalPlaceholder;

  /// No description provided for @incomeAdditionalHelper.
  ///
  /// In en, this message translates to:
  /// **'Include any side income, investments, or other sources'**
  String get incomeAdditionalHelper;

  /// No description provided for @incomeSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save Income'**
  String get incomeSaveButton;

  /// No description provided for @incomeSaveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Income information saved successfully'**
  String get incomeSaveSuccess;

  /// No description provided for @savingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Savings Goals'**
  String get savingsTitle;

  /// No description provided for @savingsAddGoal.
  ///
  /// In en, this message translates to:
  /// **'Add Goal'**
  String get savingsAddGoal;

  /// No description provided for @savingsGoalEmergencyFund.
  ///
  /// In en, this message translates to:
  /// **'Emergency Fund'**
  String get savingsGoalEmergencyFund;

  /// No description provided for @savingsGoalNewUte.
  ///
  /// In en, this message translates to:
  /// **'New Ute'**
  String get savingsGoalNewUte;

  /// No description provided for @savingsGoalHolidayTrip.
  ///
  /// In en, this message translates to:
  /// **'Holiday Trip'**
  String get savingsGoalHolidayTrip;

  /// No description provided for @savingsGoalCompleteLabel.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get savingsGoalCompleteLabel;

  /// No description provided for @savingsGoalProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get savingsGoalProgressLabel;

  /// No description provided for @savingsGoalCurrentLabel.
  ///
  /// In en, this message translates to:
  /// **'Current'**
  String get savingsGoalCurrentLabel;

  /// No description provided for @savingsGoalTargetLabel.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get savingsGoalTargetLabel;

  /// No description provided for @savingsGoalCompleted.
  ///
  /// In en, this message translates to:
  /// **'Goal Completed!'**
  String get savingsGoalCompleted;

  /// No description provided for @transactionsAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Transaction'**
  String get transactionsAddTitle;

  /// No description provided for @transactionsTypeExpense.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get transactionsTypeExpense;

  /// No description provided for @transactionsTypeIncome.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get transactionsTypeIncome;

  /// No description provided for @transactionsAmountLabel.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get transactionsAmountLabel;

  /// No description provided for @transactionsAmountPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'RWF 0.00'**
  String get transactionsAmountPlaceholder;

  /// No description provided for @transactionsAmountValidation.
  ///
  /// In en, this message translates to:
  /// **'Please enter an amount'**
  String get transactionsAmountValidation;

  /// No description provided for @transactionsCategoryLabel.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get transactionsCategoryLabel;

  /// No description provided for @transactionsCategoryShopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get transactionsCategoryShopping;

  /// No description provided for @transactionsCategoryBills.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get transactionsCategoryBills;

  /// No description provided for @transactionsCategoryEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get transactionsCategoryEntertainment;

  /// No description provided for @transactionsCategoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get transactionsCategoryOther;

  /// No description provided for @transactionsCategoryIncome.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get transactionsCategoryIncome;

  /// No description provided for @transactionsDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get transactionsDescriptionLabel;

  /// No description provided for @transactionsDescriptionPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'e.g. Lunch with team'**
  String get transactionsDescriptionPlaceholder;

  /// No description provided for @transactionsDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get transactionsDateLabel;

  /// No description provided for @transactionsDateToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get transactionsDateToday;

  /// No description provided for @transactionsSaveButton.
  ///
  /// In en, this message translates to:
  /// **'Save Transaction'**
  String get transactionsSaveButton;

  /// No description provided for @transactionsSaveSuccess.
  ///
  /// In en, this message translates to:
  /// **'Transaction saved successfully'**
  String get transactionsSaveSuccess;

  /// No description provided for @transactionsListTitle.
  ///
  /// In en, this message translates to:
  /// **'All Transactions'**
  String get transactionsListTitle;

  /// No description provided for @transactionsSectionToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get transactionsSectionToday;

  /// No description provided for @transactionsSectionYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get transactionsSectionYesterday;

  /// No description provided for @transactionsSectionWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get transactionsSectionWeek;

  /// No description provided for @transactionsDescriptionLunchCafe.
  ///
  /// In en, this message translates to:
  /// **'Lunch at Cafe'**
  String get transactionsDescriptionLunchCafe;

  /// No description provided for @transactionsDescriptionFuel.
  ///
  /// In en, this message translates to:
  /// **'Fuel'**
  String get transactionsDescriptionFuel;

  /// No description provided for @transactionsDescriptionGroceries.
  ///
  /// In en, this message translates to:
  /// **'Groceries'**
  String get transactionsDescriptionGroceries;

  /// No description provided for @transactionsDescriptionSalary.
  ///
  /// In en, this message translates to:
  /// **'Salary'**
  String get transactionsDescriptionSalary;

  /// No description provided for @transactionsDescriptionMovieTickets.
  ///
  /// In en, this message translates to:
  /// **'Movie Tickets'**
  String get transactionsDescriptionMovieTickets;

  /// No description provided for @transactionsDescriptionElectricityBill.
  ///
  /// In en, this message translates to:
  /// **'Electricity Bill'**
  String get transactionsDescriptionElectricityBill;

  /// No description provided for @transactionsDescriptionPhoneBill.
  ///
  /// In en, this message translates to:
  /// **'Phone Bill'**
  String get transactionsDescriptionPhoneBill;

  /// No description provided for @transactionsTimeLunchCafe.
  ///
  /// In en, this message translates to:
  /// **'12:30 PM'**
  String get transactionsTimeLunchCafe;

  /// No description provided for @transactionsTimeFuel.
  ///
  /// In en, this message translates to:
  /// **'09:15 AM'**
  String get transactionsTimeFuel;

  /// No description provided for @transactionsTimeGroceries.
  ///
  /// In en, this message translates to:
  /// **'06:45 PM'**
  String get transactionsTimeGroceries;

  /// No description provided for @transactionsTimeSalary.
  ///
  /// In en, this message translates to:
  /// **'09:00 AM'**
  String get transactionsTimeSalary;

  /// No description provided for @transactionsTimeMovieTickets.
  ///
  /// In en, this message translates to:
  /// **'Mon 7:30 PM'**
  String get transactionsTimeMovieTickets;

  /// No description provided for @transactionsTimeElectricityBill.
  ///
  /// In en, this message translates to:
  /// **'Mon 2:00 PM'**
  String get transactionsTimeElectricityBill;

  /// No description provided for @transactionsTimePhoneBill.
  ///
  /// In en, this message translates to:
  /// **'Sun 10:00 AM'**
  String get transactionsTimePhoneBill;

  /// No description provided for @learningCertificateScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Certificate Earned'**
  String get learningCertificateScreenTitle;

  /// No description provided for @learningCertificateCongrats.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get learningCertificateCongrats;

  /// No description provided for @learningCertificateProgramName.
  ///
  /// In en, this message translates to:
  /// **'RealWorks Employee Assistance Program'**
  String get learningCertificateProgramName;

  /// No description provided for @learningCertificateBadgeLabel.
  ///
  /// In en, this message translates to:
  /// **'CERTIFICATE'**
  String get learningCertificateBadgeLabel;

  /// No description provided for @learningCertificateAwardedTo.
  ///
  /// In en, this message translates to:
  /// **'Awarded to {name}'**
  String learningCertificateAwardedTo(Object name);

  /// No description provided for @learningCertificateDownload.
  ///
  /// In en, this message translates to:
  /// **'Download Certificate'**
  String get learningCertificateDownload;

  /// No description provided for @learningCertificateShare.
  ///
  /// In en, this message translates to:
  /// **'Share to Profile'**
  String get learningCertificateShare;

  /// No description provided for @learningCertificateDownloadedMessage.
  ///
  /// In en, this message translates to:
  /// **'{title} downloaded'**
  String learningCertificateDownloadedMessage(Object title);

  /// No description provided for @learningCertificateSharedMessage.
  ///
  /// In en, this message translates to:
  /// **'{title} shared to profile'**
  String learningCertificateSharedMessage(Object title);

  /// No description provided for @learningCertificateDefaultTitle.
  ///
  /// In en, this message translates to:
  /// **'Heavy Machinery Safety'**
  String get learningCertificateDefaultTitle;

  /// No description provided for @learningCertificateDefaultSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Completed: 15 Oct 2023'**
  String get learningCertificateDefaultSubtitle;

  /// No description provided for @learningCertificateFirstAidTitle.
  ///
  /// In en, this message translates to:
  /// **'First Aid Basics'**
  String get learningCertificateFirstAidTitle;

  /// No description provided for @learningCertificateFirstAidSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Completed: 02 Sep 2023'**
  String get learningCertificateFirstAidSubtitle;

  /// No description provided for @learningHubTitle.
  ///
  /// In en, this message translates to:
  /// **'Learning & Training'**
  String get learningHubTitle;

  /// No description provided for @learningHubSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Expand your skills and knowledge'**
  String get learningHubSubtitle;

  /// No description provided for @learningHubCategoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get learningHubCategoryAll;

  /// No description provided for @learningHubCategorySafety.
  ///
  /// In en, this message translates to:
  /// **'Safety'**
  String get learningHubCategorySafety;

  /// No description provided for @learningHubCategoryFinance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get learningHubCategoryFinance;

  /// No description provided for @learningHubCategoryWellness.
  ///
  /// In en, this message translates to:
  /// **'Wellness'**
  String get learningHubCategoryWellness;

  /// No description provided for @learningHubCategorySkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get learningHubCategorySkills;

  /// No description provided for @learningHubCertificatesHeading.
  ///
  /// In en, this message translates to:
  /// **'My Certificates'**
  String get learningHubCertificatesHeading;

  /// No description provided for @learningCourseAdvancedSafetyTitle.
  ///
  /// In en, this message translates to:
  /// **'Advanced Site Safety'**
  String get learningCourseAdvancedSafetyTitle;

  /// No description provided for @learningCourseAdvancedSafetyDuration.
  ///
  /// In en, this message translates to:
  /// **'3h 15m'**
  String get learningCourseAdvancedSafetyDuration;

  /// No description provided for @learningCourseFinancialPlanningTitle.
  ///
  /// In en, this message translates to:
  /// **'Financial Planning 101'**
  String get learningCourseFinancialPlanningTitle;

  /// No description provided for @learningCourseFinancialPlanningDuration.
  ///
  /// In en, this message translates to:
  /// **'1h 30m'**
  String get learningCourseFinancialPlanningDuration;

  /// No description provided for @learningCourseMindfulnessTitle.
  ///
  /// In en, this message translates to:
  /// **'Mindfulness at Work'**
  String get learningCourseMindfulnessTitle;

  /// No description provided for @learningCourseMindfulnessDuration.
  ///
  /// In en, this message translates to:
  /// **'45m'**
  String get learningCourseMindfulnessDuration;

  /// No description provided for @learningCourseManagingDebtTitle.
  ///
  /// In en, this message translates to:
  /// **'Managing Debt'**
  String get learningCourseManagingDebtTitle;

  /// No description provided for @learningCourseManagingDebtDuration.
  ///
  /// In en, this message translates to:
  /// **'2h 00m'**
  String get learningCourseManagingDebtDuration;

  /// No description provided for @learningHubCourseOpening.
  ///
  /// In en, this message translates to:
  /// **'Opening: {title}'**
  String learningHubCourseOpening(Object title);

  /// No description provided for @selfAssessmentScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Wellness Check-In'**
  String get selfAssessmentScreenTitle;

  /// No description provided for @selfAssessmentProgressLabel.
  ///
  /// In en, this message translates to:
  /// **'Question {current} of {total}'**
  String selfAssessmentProgressLabel(Object current, Object total);

  /// No description provided for @selfAssessmentProgressPercent.
  ///
  /// In en, this message translates to:
  /// **'{percent}%'**
  String selfAssessmentProgressPercent(Object percent);

  /// No description provided for @selfAssessmentQuestionStress.
  ///
  /// In en, this message translates to:
  /// **'How often have you felt stressed in the past week?'**
  String get selfAssessmentQuestionStress;

  /// No description provided for @selfAssessmentQuestionSleepQuality.
  ///
  /// In en, this message translates to:
  /// **'How would you rate your sleep quality?'**
  String get selfAssessmentQuestionSleepQuality;

  /// No description provided for @selfAssessmentQuestionOverwhelmed.
  ///
  /// In en, this message translates to:
  /// **'Do you feel overwhelmed by daily tasks?'**
  String get selfAssessmentQuestionOverwhelmed;

  /// No description provided for @selfAssessmentOptionNever.
  ///
  /// In en, this message translates to:
  /// **'Never'**
  String get selfAssessmentOptionNever;

  /// No description provided for @selfAssessmentOptionRarely.
  ///
  /// In en, this message translates to:
  /// **'Rarely'**
  String get selfAssessmentOptionRarely;

  /// No description provided for @selfAssessmentOptionSometimes.
  ///
  /// In en, this message translates to:
  /// **'Sometimes'**
  String get selfAssessmentOptionSometimes;

  /// No description provided for @selfAssessmentOptionOften.
  ///
  /// In en, this message translates to:
  /// **'Often'**
  String get selfAssessmentOptionOften;

  /// No description provided for @selfAssessmentOptionVeryOften.
  ///
  /// In en, this message translates to:
  /// **'Very Often'**
  String get selfAssessmentOptionVeryOften;

  /// No description provided for @selfAssessmentOptionExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get selfAssessmentOptionExcellent;

  /// No description provided for @selfAssessmentOptionGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get selfAssessmentOptionGood;

  /// No description provided for @selfAssessmentOptionFair.
  ///
  /// In en, this message translates to:
  /// **'Fair'**
  String get selfAssessmentOptionFair;

  /// No description provided for @selfAssessmentOptionPoor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get selfAssessmentOptionPoor;

  /// No description provided for @selfAssessmentOptionAlways.
  ///
  /// In en, this message translates to:
  /// **'Always'**
  String get selfAssessmentOptionAlways;

  /// No description provided for @selfAssessmentNextQuestion.
  ///
  /// In en, this message translates to:
  /// **'Next Question'**
  String get selfAssessmentNextQuestion;

  /// No description provided for @selfAssessmentComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete Assessment'**
  String get selfAssessmentComplete;

  /// No description provided for @selfAssessmentCompletedMessage.
  ///
  /// In en, this message translates to:
  /// **'Assessment completed!'**
  String get selfAssessmentCompletedMessage;

  /// No description provided for @aboutHelpScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'About & Help'**
  String get aboutHelpScreenTitle;

  /// No description provided for @aboutHelpAppName.
  ///
  /// In en, this message translates to:
  /// **'RealWorks EAP'**
  String get aboutHelpAppName;

  /// No description provided for @aboutHelpVersionLabel.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String aboutHelpVersionLabel(Object version);

  /// No description provided for @aboutHelpAboutSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'About This App'**
  String get aboutHelpAboutSectionTitle;

  /// No description provided for @aboutHelpAboutDescription.
  ///
  /// In en, this message translates to:
  /// **'RealWorks Employee Assistance Program provides comprehensive support for your wellbeing, financial literacy, mental health, and professional development. Access counseling, learning resources, and tools to help you thrive at work and in life.'**
  String get aboutHelpAboutDescription;

  /// No description provided for @aboutHelpSupportSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get aboutHelpSupportSectionTitle;

  /// No description provided for @aboutHelpContactSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get aboutHelpContactSupportTitle;

  /// No description provided for @aboutHelpContactSupportSubtitle.
  ///
  /// In en, this message translates to:
  /// **'24/7 helpline available'**
  String get aboutHelpContactSupportSubtitle;

  /// No description provided for @aboutHelpEmailUsTitle.
  ///
  /// In en, this message translates to:
  /// **'Email Us'**
  String get aboutHelpEmailUsTitle;

  /// No description provided for @aboutHelpEmailUsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'support@realworks-eap.com'**
  String get aboutHelpEmailUsSubtitle;

  /// No description provided for @aboutHelpFaqTitle.
  ///
  /// In en, this message translates to:
  /// **'FAQ'**
  String get aboutHelpFaqTitle;

  /// No description provided for @aboutHelpFaqSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently asked questions'**
  String get aboutHelpFaqSubtitle;

  /// No description provided for @aboutHelpReportProblemTitle.
  ///
  /// In en, this message translates to:
  /// **'Report a Problem'**
  String get aboutHelpReportProblemTitle;

  /// No description provided for @aboutHelpReportProblemSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Help us improve the app'**
  String get aboutHelpReportProblemSubtitle;

  /// No description provided for @aboutHelpLegalSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get aboutHelpLegalSectionTitle;

  /// No description provided for @commonTermsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get commonTermsOfService;

  /// No description provided for @commonPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get commonPrivacyPolicy;

  /// No description provided for @commonDataProtection.
  ///
  /// In en, this message translates to:
  /// **'Data Protection'**
  String get commonDataProtection;

  /// No description provided for @aboutHelpFooterText.
  ///
  /// In en, this message translates to:
  /// **'© 2024 RealWorks EAP. All rights reserved.'**
  String get aboutHelpFooterText;

  /// No description provided for @settingsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsScreenTitle;

  /// No description provided for @settingsSectionNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settingsSectionNotificationsTitle;

  /// No description provided for @settingsEnableNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Enable Notifications'**
  String get settingsEnableNotificationsTitle;

  /// No description provided for @settingsEnableNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive app notifications'**
  String get settingsEnableNotificationsSubtitle;

  /// No description provided for @settingsPushNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get settingsPushNotificationsTitle;

  /// No description provided for @settingsPushNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notified on your device'**
  String get settingsPushNotificationsSubtitle;

  /// No description provided for @settingsEmailNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Email Notifications'**
  String get settingsEmailNotificationsTitle;

  /// No description provided for @settingsEmailNotificationsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Receive updates via email'**
  String get settingsEmailNotificationsSubtitle;

  /// No description provided for @settingsSectionAppearanceTitle.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get settingsSectionAppearanceTitle;

  /// No description provided for @settingsDarkModeTitle.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get settingsDarkModeTitle;

  /// No description provided for @settingsDarkModeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use dark theme'**
  String get settingsDarkModeSubtitle;

  /// No description provided for @settingsSectionAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get settingsSectionAccountTitle;

  /// No description provided for @settingsChangePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get settingsChangePasswordTitle;

  /// No description provided for @settingsPrivacySettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Settings'**
  String get settingsPrivacySettingsTitle;

  /// No description provided for @settingsSecurityTitle.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settingsSecurityTitle;

  /// No description provided for @settingsSectionSupportTitle.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get settingsSectionSupportTitle;

  /// No description provided for @commonHelpCenter.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get commonHelpCenter;

  /// No description provided for @commonSendFeedback.
  ///
  /// In en, this message translates to:
  /// **'Send Feedback'**
  String get commonSendFeedback;

  /// No description provided for @settingsAppVersion.
  ///
  /// In en, this message translates to:
  /// **'RealWorks EAP v{version}'**
  String settingsAppVersion(Object version);

  /// No description provided for @notificationsScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationsScreenTitle;

  /// No description provided for @notificationsMarkAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get notificationsMarkAllRead;

  /// No description provided for @notificationsAppointmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Appointment'**
  String get notificationsAppointmentTitle;

  /// No description provided for @notificationsAppointmentMessage.
  ///
  /// In en, this message translates to:
  /// **'Your appointment with Dr. Evans is tomorrow at 2:00 PM'**
  String get notificationsAppointmentMessage;

  /// No description provided for @notificationsAppointmentTime.
  ///
  /// In en, this message translates to:
  /// **'2 hours ago'**
  String get notificationsAppointmentTime;

  /// No description provided for @notificationsArticleTitle.
  ///
  /// In en, this message translates to:
  /// **'New Article Available'**
  String get notificationsArticleTitle;

  /// No description provided for @notificationsArticleMessage.
  ///
  /// In en, this message translates to:
  /// **'Check out \"Managing Work Stress in a Fast-Paced Environment\"'**
  String get notificationsArticleMessage;

  /// No description provided for @notificationsArticleTime.
  ///
  /// In en, this message translates to:
  /// **'5 hours ago'**
  String get notificationsArticleTime;

  /// No description provided for @notificationsGoalTitle.
  ///
  /// In en, this message translates to:
  /// **'Goal Achievement!'**
  String get notificationsGoalTitle;

  /// No description provided for @notificationsGoalMessage.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! You completed your weekly wellness goal'**
  String get notificationsGoalMessage;

  /// No description provided for @notificationsGoalTime.
  ///
  /// In en, this message translates to:
  /// **'1 day ago'**
  String get notificationsGoalTime;

  /// No description provided for @notificationsWellbeingTitle.
  ///
  /// In en, this message translates to:
  /// **'Wellbeing Score Updated'**
  String get notificationsWellbeingTitle;

  /// No description provided for @notificationsWellbeingMessage.
  ///
  /// In en, this message translates to:
  /// **'Your wellbeing score improved by 5 points this week'**
  String get notificationsWellbeingMessage;

  /// No description provided for @notificationsWellbeingTime.
  ///
  /// In en, this message translates to:
  /// **'2 days ago'**
  String get notificationsWellbeingTime;

  /// No description provided for @adminDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Admin Dashboard'**
  String get adminDashboardTitle;

  /// No description provided for @adminDashboardPeriodLast7Days.
  ///
  /// In en, this message translates to:
  /// **'Last 7 Days'**
  String get adminDashboardPeriodLast7Days;

  /// No description provided for @adminDashboardPeriodLast30Days.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Days'**
  String get adminDashboardPeriodLast30Days;

  /// No description provided for @adminDashboardPeriodAllTime.
  ///
  /// In en, this message translates to:
  /// **'All Time'**
  String get adminDashboardPeriodAllTime;

  /// No description provided for @adminDashboardStatActiveUsers.
  ///
  /// In en, this message translates to:
  /// **'Active Users'**
  String get adminDashboardStatActiveUsers;

  /// No description provided for @adminDashboardStatCompletedSessions.
  ///
  /// In en, this message translates to:
  /// **'Completed Sessions'**
  String get adminDashboardStatCompletedSessions;

  /// No description provided for @adminDashboardTopResourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Top Used Resource'**
  String get adminDashboardTopResourceLabel;

  /// No description provided for @adminDashboardTopResourceMeditation.
  ///
  /// In en, this message translates to:
  /// **'Meditation'**
  String get adminDashboardTopResourceMeditation;

  /// No description provided for @adminDashboardEngagementRate.
  ///
  /// In en, this message translates to:
  /// **'Engagement Rate'**
  String get adminDashboardEngagementRate;

  /// No description provided for @adminDashboardLast30Days.
  ///
  /// In en, this message translates to:
  /// **'Last 30 Days'**
  String get adminDashboardLast30Days;

  /// No description provided for @adminDashboardWeekLabel.
  ///
  /// In en, this message translates to:
  /// **'Week {week}'**
  String adminDashboardWeekLabel(Object week);

  /// No description provided for @adminDashboardSessionCompletion.
  ///
  /// In en, this message translates to:
  /// **'Session Completion by Category'**
  String get adminDashboardSessionCompletion;

  /// No description provided for @adminDashboardCategoryStress.
  ///
  /// In en, this message translates to:
  /// **'Stress'**
  String get adminDashboardCategoryStress;

  /// No description provided for @adminDashboardCategoryAnxiety.
  ///
  /// In en, this message translates to:
  /// **'Anxiety'**
  String get adminDashboardCategoryAnxiety;

  /// No description provided for @adminDashboardCategorySleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get adminDashboardCategorySleep;

  /// No description provided for @adminDashboardCategoryFocus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get adminDashboardCategoryFocus;

  /// No description provided for @adminDashboardExport.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get adminDashboardExport;

  /// No description provided for @adminDashboardExporting.
  ///
  /// In en, this message translates to:
  /// **'Exporting data...'**
  String get adminDashboardExporting;

  /// No description provided for @profileScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileScreenTitle;

  /// No description provided for @profileDefaultName.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get profileDefaultName;

  /// No description provided for @profileDefaultEmail.
  ///
  /// In en, this message translates to:
  /// **'user@example.com'**
  String get profileDefaultEmail;

  /// No description provided for @profileOptionEditProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get profileOptionEditProfile;

  /// No description provided for @profileOptionHealthRecords.
  ///
  /// In en, this message translates to:
  /// **'Health Records'**
  String get profileOptionHealthRecords;

  /// No description provided for @profileOptionCounselingHistory.
  ///
  /// In en, this message translates to:
  /// **'Counseling History'**
  String get profileOptionCounselingHistory;

  /// No description provided for @profileOptionFinancialGoals.
  ///
  /// In en, this message translates to:
  /// **'Financial Goals'**
  String get profileOptionFinancialGoals;

  /// No description provided for @profileOptionNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profileOptionNotifications;

  /// No description provided for @profileOptionHelpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get profileOptionHelpSupport;

  /// No description provided for @profileOptionAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get profileOptionAbout;

  /// No description provided for @profileLogout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profileLogout;

  /// No description provided for @aiCompanionNewChatTitle.
  ///
  /// In en, this message translates to:
  /// **'New Chat'**
  String get aiCompanionNewChatTitle;

  /// No description provided for @aiCompanionPromptHeadline.
  ///
  /// In en, this message translates to:
  /// **'Ask me anything about your wellbeing'**
  String get aiCompanionPromptHeadline;

  /// No description provided for @aiCompanionSuggestionStress.
  ///
  /// In en, this message translates to:
  /// **'Feeling stressed after a long shift?'**
  String get aiCompanionSuggestionStress;

  /// No description provided for @aiCompanionSuggestionBudget.
  ///
  /// In en, this message translates to:
  /// **'How can I budget my earnings better?'**
  String get aiCompanionSuggestionBudget;

  /// No description provided for @commonMessageInputHint.
  ///
  /// In en, this message translates to:
  /// **'Type your message...'**
  String get commonMessageInputHint;

  /// No description provided for @aiCompanionTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Companion'**
  String get aiCompanionTitle;

  /// No description provided for @aiCompanionStatusOnline.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get aiCompanionStatusOnline;

  /// No description provided for @aiCompanionSampleUserMessage.
  ///
  /// In en, this message translates to:
  /// **'I\'m feeling stressed today.'**
  String get aiCompanionSampleUserMessage;

  /// No description provided for @aiCompanionSampleCoachPrompt.
  ///
  /// In en, this message translates to:
  /// **'I\'m here to listen. Tell me more about what\'s on your mind.'**
  String get aiCompanionSampleCoachPrompt;

  /// No description provided for @aiCompanionSampleCoachFollowup.
  ///
  /// In en, this message translates to:
  /// **'I understand. Let\'s talk through this together.'**
  String get aiCompanionSampleCoachFollowup;

  /// No description provided for @aiCompanionHistoryNewChat.
  ///
  /// In en, this message translates to:
  /// **'New Chat'**
  String get aiCompanionHistoryNewChat;

  /// No description provided for @aiCompanionHistoryRecentChats.
  ///
  /// In en, this message translates to:
  /// **'Recent Chats'**
  String get aiCompanionHistoryRecentChats;

  /// No description provided for @aiCompanionHistoryTopicShiftFatigue.
  ///
  /// In en, this message translates to:
  /// **'Managing Shift Work Fatigue'**
  String get aiCompanionHistoryTopicShiftFatigue;

  /// No description provided for @aiCompanionHistoryPreviewShiftFatigue.
  ///
  /// In en, this message translates to:
  /// **'You: What are some tips for better sleep during t...'**
  String get aiCompanionHistoryPreviewShiftFatigue;

  /// No description provided for @aiCompanionHistoryTopicBudgeting.
  ///
  /// In en, this message translates to:
  /// **'Budgeting Strategies for Miners'**
  String get aiCompanionHistoryTopicBudgeting;

  /// No description provided for @aiCompanionHistoryPreviewBudgeting.
  ///
  /// In en, this message translates to:
  /// **'AI: Creating a detailed budget is the first step. L...'**
  String get aiCompanionHistoryPreviewBudgeting;

  /// No description provided for @aiCompanionHistoryTopicConflict.
  ///
  /// In en, this message translates to:
  /// **'Conflict Resolution with Co-workers'**
  String get aiCompanionHistoryTopicConflict;

  /// No description provided for @aiCompanionHistoryPreviewConflict.
  ///
  /// In en, this message translates to:
  /// **'You: How do I talk to a colleague about safety co...'**
  String get aiCompanionHistoryPreviewConflict;

  /// No description provided for @aiCompanionHistoryTopicBenefits.
  ///
  /// In en, this message translates to:
  /// **'Understanding EAP Benefits'**
  String get aiCompanionHistoryTopicBenefits;

  /// No description provided for @aiCompanionHistoryPreviewBenefits.
  ///
  /// In en, this message translates to:
  /// **'AI: Your EAP provides access to confidential cou...'**
  String get aiCompanionHistoryPreviewBenefits;

  /// No description provided for @aiCompanionHistoryTimeMorning.
  ///
  /// In en, this message translates to:
  /// **'10:42 AM'**
  String get aiCompanionHistoryTimeMorning;

  /// No description provided for @aiCompanionHistoryTimeYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get aiCompanionHistoryTimeYesterday;

  /// No description provided for @aiCompanionHistoryTimeDateOne.
  ///
  /// In en, this message translates to:
  /// **'02/11/23'**
  String get aiCompanionHistoryTimeDateOne;

  /// No description provided for @aiCompanionHistoryTimeDateTwo.
  ///
  /// In en, this message translates to:
  /// **'01/11/23'**
  String get aiCompanionHistoryTimeDateTwo;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navTopics.
  ///
  /// In en, this message translates to:
  /// **'Topics'**
  String get navTopics;

  /// No description provided for @navChatbot.
  ///
  /// In en, this message translates to:
  /// **'Chatbot'**
  String get navChatbot;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @aiCompanionGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hi, {name}.'**
  String aiCompanionGreeting(Object name);

  /// No description provided for @aiCompanionWelcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your confidential wellbeing partner is here to help.'**
  String get aiCompanionWelcomeSubtitle;

  /// No description provided for @aiCompanionAskAnythingCard.
  ///
  /// In en, this message translates to:
  /// **'Ask me anything...'**
  String get aiCompanionAskAnythingCard;

  /// No description provided for @aiCompanionCategoryCounseling.
  ///
  /// In en, this message translates to:
  /// **'Confidential Counseling'**
  String get aiCompanionCategoryCounseling;

  /// No description provided for @aiCompanionCategoryFinancial.
  ///
  /// In en, this message translates to:
  /// **'Financial Planning'**
  String get aiCompanionCategoryFinancial;

  /// No description provided for @aiCompanionCategorySafety.
  ///
  /// In en, this message translates to:
  /// **'Safety Guideline Queries'**
  String get aiCompanionCategorySafety;

  /// No description provided for @aiCompanionSuggestedTitle.
  ///
  /// In en, this message translates to:
  /// **'Suggested for You'**
  String get aiCompanionSuggestedTitle;

  /// No description provided for @aiCompanionSuggestionShiftFatigue.
  ///
  /// In en, this message translates to:
  /// **'How to manage shift work fatigue?'**
  String get aiCompanionSuggestionShiftFatigue;

  /// No description provided for @aiCompanionSuggestionStressTips.
  ///
  /// In en, this message translates to:
  /// **'Tips for managing stress on site.'**
  String get aiCompanionSuggestionStressTips;

  /// No description provided for @aiCompanionSuggestionBudgeting.
  ///
  /// In en, this message translates to:
  /// **'What are some good budgeting strategies?'**
  String get aiCompanionSuggestionBudgeting;

  /// No description provided for @aiCompanionThinkingMessage.
  ///
  /// In en, this message translates to:
  /// **'Your AI companion is thinking...'**
  String get aiCompanionThinkingMessage;

  /// No description provided for @aiCompanionTipBreathing.
  ///
  /// In en, this message translates to:
  /// **'Tip: Taking three deep breaths can help calm your nervous system.'**
  String get aiCompanionTipBreathing;

  /// No description provided for @commonLearnMore.
  ///
  /// In en, this message translates to:
  /// **'Learn More'**
  String get commonLearnMore;

  /// No description provided for @environmentalScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Environmental Wellbeing'**
  String get environmentalScreenTitle;

  /// No description provided for @environmentalChallengeTracker.
  ///
  /// In en, this message translates to:
  /// **'Challenge Tracker'**
  String get environmentalChallengeTracker;

  /// No description provided for @environmentalChallengeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Complete 3 eco-tasks this week'**
  String get environmentalChallengeHeadline;

  /// No description provided for @environmentalChallengeDescription.
  ///
  /// In en, this message translates to:
  /// **'Track your progress and make a positive impact on the environment.'**
  String get environmentalChallengeDescription;

  /// No description provided for @environmentalThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week\'s Challenge'**
  String get environmentalThisWeek;

  /// No description provided for @environmentalProgress.
  ///
  /// In en, this message translates to:
  /// **'1/3 Complete'**
  String get environmentalProgress;

  /// No description provided for @environmentalTipsTitle.
  ///
  /// In en, this message translates to:
  /// **'Tips for a Greener Routine'**
  String get environmentalTipsTitle;

  /// No description provided for @environmentalTipReduceWasteTitle.
  ///
  /// In en, this message translates to:
  /// **'Reduce Your Waste'**
  String get environmentalTipReduceWasteTitle;

  /// No description provided for @environmentalTipReduceWasteDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn simple ways to minimize your daily waste.'**
  String get environmentalTipReduceWasteDescription;

  /// No description provided for @environmentalTipConserveWaterTitle.
  ///
  /// In en, this message translates to:
  /// **'Conserve Water'**
  String get environmentalTipConserveWaterTitle;

  /// No description provided for @environmentalTipConserveWaterDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover easy tricks to save water at home.'**
  String get environmentalTipConserveWaterDescription;

  /// No description provided for @environmentalTipSaveEnergyTitle.
  ///
  /// In en, this message translates to:
  /// **'Save Energy at Home'**
  String get environmentalTipSaveEnergyTitle;

  /// No description provided for @environmentalTipSaveEnergyDescription.
  ///
  /// In en, this message translates to:
  /// **'Cut down on your electricity consumption effortlessly.'**
  String get environmentalTipSaveEnergyDescription;

  /// No description provided for @environmentalTipSustainableTransportTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose Sustainable Transport'**
  String get environmentalTipSustainableTransportTitle;

  /// No description provided for @environmentalTipSustainableTransportDescription.
  ///
  /// In en, this message translates to:
  /// **'Opt for greener ways to get around town.'**
  String get environmentalTipSustainableTransportDescription;

  /// No description provided for @srhScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'SRH & Family Planning'**
  String get srhScreenTitle;

  /// No description provided for @srhCardContraceptionTitle.
  ///
  /// In en, this message translates to:
  /// **'Understanding Contraception'**
  String get srhCardContraceptionTitle;

  /// No description provided for @srhCardContraceptionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Explore different methods and find what\'s right for you.'**
  String get srhCardContraceptionSubtitle;

  /// No description provided for @srhCardFamilyPlanningTitle.
  ///
  /// In en, this message translates to:
  /// **'Planning for a Family'**
  String get srhCardFamilyPlanningTitle;

  /// No description provided for @srhCardFamilyPlanningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Resources and support for your journey to parenthood.'**
  String get srhCardFamilyPlanningSubtitle;

  /// No description provided for @srhCardMensHealthTitle.
  ///
  /// In en, this message translates to:
  /// **'Men\'s Reproductive Health'**
  String get srhCardMensHealthTitle;

  /// No description provided for @srhCardMensHealthSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Information on health, wellness, and preventative care.'**
  String get srhCardMensHealthSubtitle;

  /// No description provided for @srhCardWomensHealthTitle.
  ///
  /// In en, this message translates to:
  /// **'Women\'s Reproductive Health'**
  String get srhCardWomensHealthTitle;

  /// No description provided for @srhCardWomensHealthSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Guidance on cycles, health screenings, and more.'**
  String get srhCardWomensHealthSubtitle;

  /// No description provided for @counselorBookingTitle.
  ///
  /// In en, this message translates to:
  /// **'Book a Session'**
  String get counselorBookingTitle;

  /// No description provided for @counselorBookingCounselorName.
  ///
  /// In en, this message translates to:
  /// **'Dr. Sarah Johnson'**
  String get counselorBookingCounselorName;

  /// No description provided for @counselorBookingCounselorSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Clinical Psychologist'**
  String get counselorBookingCounselorSpecialty;

  /// No description provided for @counselorBookingRatingLabel.
  ///
  /// In en, this message translates to:
  /// **'{rating} ({count} reviews)'**
  String counselorBookingRatingLabel(Object rating, Object count);

  /// No description provided for @counselorBookingSelectDate.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get counselorBookingSelectDate;

  /// No description provided for @counselorBookingAvailableSlots.
  ///
  /// In en, this message translates to:
  /// **'Available Time Slots'**
  String get counselorBookingAvailableSlots;

  /// No description provided for @counselorBookingDateLabel.
  ///
  /// In en, this message translates to:
  /// **'{day}\n{date}'**
  String counselorBookingDateLabel(Object day, Object date);

  /// No description provided for @counselorBookingWeekdayMon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get counselorBookingWeekdayMon;

  /// No description provided for @counselorBookingWeekdayTue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get counselorBookingWeekdayTue;

  /// No description provided for @counselorBookingWeekdayWed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get counselorBookingWeekdayWed;

  /// No description provided for @counselorBookingWeekdayThu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get counselorBookingWeekdayThu;

  /// No description provided for @counselorBookingWeekdayFri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get counselorBookingWeekdayFri;

  /// No description provided for @counselorBookingConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Booking'**
  String get counselorBookingConfirm;

  /// No description provided for @counselorBookingSuccess.
  ///
  /// In en, this message translates to:
  /// **'Session booked successfully!'**
  String get counselorBookingSuccess;

  /// No description provided for @sessionHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Session History'**
  String get sessionHistoryTitle;

  /// No description provided for @sessionHistoryUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming Sessions'**
  String get sessionHistoryUpcoming;

  /// No description provided for @sessionHistoryPast.
  ///
  /// In en, this message translates to:
  /// **'Past Sessions'**
  String get sessionHistoryPast;

  /// No description provided for @sessionHistoryStatusUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get sessionHistoryStatusUpcoming;

  /// No description provided for @sessionHistoryStatusCompleted.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get sessionHistoryStatusCompleted;

  /// No description provided for @sessionHistoryDateOne.
  ///
  /// In en, this message translates to:
  /// **'Monday, Nov 13'**
  String get sessionHistoryDateOne;

  /// No description provided for @sessionHistoryDateTwo.
  ///
  /// In en, this message translates to:
  /// **'Friday, Nov 3'**
  String get sessionHistoryDateTwo;

  /// No description provided for @sessionHistoryDateThree.
  ///
  /// In en, this message translates to:
  /// **'Monday, Oct 23'**
  String get sessionHistoryDateThree;

  /// No description provided for @sessionHistoryDateFour.
  ///
  /// In en, this message translates to:
  /// **'Wednesday, Oct 11'**
  String get sessionHistoryDateFour;

  /// No description provided for @sessionHistoryTimeMorning.
  ///
  /// In en, this message translates to:
  /// **'10:00 AM'**
  String get sessionHistoryTimeMorning;

  /// No description provided for @sessionHistoryTimeAfternoon.
  ///
  /// In en, this message translates to:
  /// **'02:00 PM'**
  String get sessionHistoryTimeAfternoon;

  /// No description provided for @sessionHistoryTimeLateAfternoon.
  ///
  /// In en, this message translates to:
  /// **'03:00 PM'**
  String get sessionHistoryTimeLateAfternoon;

  /// No description provided for @sessionHistoryCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get sessionHistoryCancel;

  /// No description provided for @sessionHistoryJoin.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get sessionHistoryJoin;

  /// No description provided for @sessionHistoryBookSession.
  ///
  /// In en, this message translates to:
  /// **'Book Session'**
  String get sessionHistoryBookSession;

  /// No description provided for @chatResourcesTitle.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get chatResourcesTitle;

  /// No description provided for @chatResourcesRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended Resources'**
  String get chatResourcesRecommended;

  /// No description provided for @chatResourcesArticleStress.
  ///
  /// In en, this message translates to:
  /// **'Managing Stress at Work'**
  String get chatResourcesArticleStress;

  /// No description provided for @chatResourcesArticleFinancialResilience.
  ///
  /// In en, this message translates to:
  /// **'Building Financial Resilience'**
  String get chatResourcesArticleFinancialResilience;

  /// No description provided for @chatResourcesArticleBreathing.
  ///
  /// In en, this message translates to:
  /// **'Mindful Breathing Exercises'**
  String get chatResourcesArticleBreathing;

  /// No description provided for @chatResourcesArticleSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep Better with Shift Work'**
  String get chatResourcesArticleSleep;

  /// No description provided for @chatResourcesArticleConflict.
  ///
  /// In en, this message translates to:
  /// **'Conflict Resolution Tips'**
  String get chatResourcesArticleConflict;

  /// No description provided for @commonCategoryMentalHealth.
  ///
  /// In en, this message translates to:
  /// **'Mental Health'**
  String get commonCategoryMentalHealth;

  /// No description provided for @commonCategoryFinance.
  ///
  /// In en, this message translates to:
  /// **'Finance'**
  String get commonCategoryFinance;

  /// No description provided for @commonCategoryWellness.
  ///
  /// In en, this message translates to:
  /// **'Wellness'**
  String get commonCategoryWellness;

  /// No description provided for @commonCategoryHealth.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get commonCategoryHealth;

  /// No description provided for @commonCategoryRelationships.
  ///
  /// In en, this message translates to:
  /// **'Relationships'**
  String get commonCategoryRelationships;

  /// No description provided for @commonDurationMinutesRead.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min read'**
  String commonDurationMinutesRead(Object minutes);

  /// No description provided for @commonDurationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min'**
  String commonDurationMinutes(Object minutes);

  /// No description provided for @chatResourcesCategoryDuration.
  ///
  /// In en, this message translates to:
  /// **'{category} • {duration}'**
  String chatResourcesCategoryDuration(Object category, Object duration);

  /// No description provided for @chatbotTopicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a Topic'**
  String get chatbotTopicsTitle;

  /// No description provided for @chatbotTopicsPrompt.
  ///
  /// In en, this message translates to:
  /// **'What would you like to talk about?'**
  String get chatbotTopicsPrompt;

  /// No description provided for @chatbotTopicMentalWellbeingTitle.
  ///
  /// In en, this message translates to:
  /// **'Mental Wellbeing'**
  String get chatbotTopicMentalWellbeingTitle;

  /// No description provided for @chatbotTopicMentalWellbeingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Stress, anxiety, and emotional health'**
  String get chatbotTopicMentalWellbeingSubtitle;

  /// No description provided for @chatbotTopicFinancialPlanningTitle.
  ///
  /// In en, this message translates to:
  /// **'Financial Planning'**
  String get chatbotTopicFinancialPlanningTitle;

  /// No description provided for @chatbotTopicFinancialPlanningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Budgeting, saving, and money management'**
  String get chatbotTopicFinancialPlanningSubtitle;

  /// No description provided for @chatbotTopicPhysicalHealthTitle.
  ///
  /// In en, this message translates to:
  /// **'Physical Health'**
  String get chatbotTopicPhysicalHealthTitle;

  /// No description provided for @chatbotTopicPhysicalHealthSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Exercise, nutrition, and wellness'**
  String get chatbotTopicPhysicalHealthSubtitle;

  /// No description provided for @chatbotTopicWorkLifeTitle.
  ///
  /// In en, this message translates to:
  /// **'Work-Life Balance'**
  String get chatbotTopicWorkLifeTitle;

  /// No description provided for @chatbotTopicWorkLifeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Managing shift work and time'**
  String get chatbotTopicWorkLifeSubtitle;

  /// No description provided for @chatbotTopicFamilyTitle.
  ///
  /// In en, this message translates to:
  /// **'Family & Relationships'**
  String get chatbotTopicFamilyTitle;

  /// No description provided for @chatbotTopicFamilySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Support for family matters'**
  String get chatbotTopicFamilySubtitle;

  /// No description provided for @chatbotTopicLearningTitle.
  ///
  /// In en, this message translates to:
  /// **'Learning & Development'**
  String get chatbotTopicLearningTitle;

  /// No description provided for @chatbotTopicLearningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Skills training and education'**
  String get chatbotTopicLearningSubtitle;

  /// No description provided for @goalSetupTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Savings Goal'**
  String get goalSetupTitle;

  /// No description provided for @goalSetupHeading.
  ///
  /// In en, this message translates to:
  /// **'Set your financial goal'**
  String get goalSetupHeading;

  /// No description provided for @goalSetupDescription.
  ///
  /// In en, this message translates to:
  /// **'Track your progress towards achieving your financial objectives'**
  String get goalSetupDescription;

  /// No description provided for @goalSetupFieldName.
  ///
  /// In en, this message translates to:
  /// **'Goal Name'**
  String get goalSetupFieldName;

  /// No description provided for @goalSetupHintName.
  ///
  /// In en, this message translates to:
  /// **'e.g. Emergency Fund, New Car'**
  String get goalSetupHintName;

  /// No description provided for @goalSetupFieldTargetAmount.
  ///
  /// In en, this message translates to:
  /// **'Target Amount'**
  String get goalSetupFieldTargetAmount;

  /// No description provided for @goalSetupHintTargetAmount.
  ///
  /// In en, this message translates to:
  /// **'RWF 5,625,000'**
  String get goalSetupHintTargetAmount;

  /// No description provided for @goalSetupFieldCurrentAmount.
  ///
  /// In en, this message translates to:
  /// **'Current Amount (Optional)'**
  String get goalSetupFieldCurrentAmount;

  /// No description provided for @goalSetupHintCurrentAmount.
  ///
  /// In en, this message translates to:
  /// **'RWF 0'**
  String get goalSetupHintCurrentAmount;

  /// No description provided for @goalSetupFieldTargetDate.
  ///
  /// In en, this message translates to:
  /// **'Target Date'**
  String get goalSetupFieldTargetDate;

  /// No description provided for @goalSetupErrorName.
  ///
  /// In en, this message translates to:
  /// **'Please enter a goal name'**
  String get goalSetupErrorName;

  /// No description provided for @goalSetupErrorTargetAmount.
  ///
  /// In en, this message translates to:
  /// **'Please enter a target amount'**
  String get goalSetupErrorTargetAmount;

  /// No description provided for @goalSetupCreate.
  ///
  /// In en, this message translates to:
  /// **'Create Goal'**
  String get goalSetupCreate;

  /// No description provided for @goalSetupSuccess.
  ///
  /// In en, this message translates to:
  /// **'Goal created successfully'**
  String get goalSetupSuccess;

  /// No description provided for @expenseCategoriesTitle.
  ///
  /// In en, this message translates to:
  /// **'Expense Categories'**
  String get expenseCategoriesTitle;

  /// No description provided for @expenseCategoriesHeading.
  ///
  /// In en, this message translates to:
  /// **'Set up your expense categories'**
  String get expenseCategoriesHeading;

  /// No description provided for @expenseCategoriesDescription.
  ///
  /// In en, this message translates to:
  /// **'Choose the categories that match your spending habits'**
  String get expenseCategoriesDescription;

  /// No description provided for @expenseCategoriesButton.
  ///
  /// In en, this message translates to:
  /// **'Save Categories'**
  String get expenseCategoriesButton;

  /// No description provided for @expenseCategoriesSuccess.
  ///
  /// In en, this message translates to:
  /// **'Categories saved successfully'**
  String get expenseCategoriesSuccess;

  /// No description provided for @expenseCategoryFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get expenseCategoryFood;

  /// No description provided for @expenseCategoryTransport.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get expenseCategoryTransport;

  /// No description provided for @expenseCategoryShopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get expenseCategoryShopping;

  /// No description provided for @expenseCategoryHousing.
  ///
  /// In en, this message translates to:
  /// **'Housing'**
  String get expenseCategoryHousing;

  /// No description provided for @expenseCategoryHealthcare.
  ///
  /// In en, this message translates to:
  /// **'Healthcare'**
  String get expenseCategoryHealthcare;

  /// No description provided for @expenseCategoryEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get expenseCategoryEducation;

  /// No description provided for @expenseCategoryEntertainment.
  ///
  /// In en, this message translates to:
  /// **'Entertainment'**
  String get expenseCategoryEntertainment;

  /// No description provided for @expenseCategoryFitness.
  ///
  /// In en, this message translates to:
  /// **'Fitness'**
  String get expenseCategoryFitness;

  /// No description provided for @financialLiteracyTitle.
  ///
  /// In en, this message translates to:
  /// **'Financial Literacy'**
  String get financialLiteracyTitle;

  /// No description provided for @financialLiteracyHeroTitle.
  ///
  /// In en, this message translates to:
  /// **'Build Financial Confidence'**
  String get financialLiteracyHeroTitle;

  /// No description provided for @financialLiteracyHeroDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn essential financial skills to manage your money, plan for the future, and achieve your goals.'**
  String get financialLiteracyHeroDescription;

  /// No description provided for @financialLiteracyFeaturedTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Courses'**
  String get financialLiteracyFeaturedTitle;

  /// No description provided for @financialLiteracyFeaturedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Start learning today'**
  String get financialLiteracyFeaturedSubtitle;

  /// No description provided for @financialCourseBudgetingTitle.
  ///
  /// In en, this message translates to:
  /// **'Budgeting Basics'**
  String get financialCourseBudgetingTitle;

  /// No description provided for @financialCourseBudgetingDescription.
  ///
  /// In en, this message translates to:
  /// **'Learn how to create and stick to a budget'**
  String get financialCourseBudgetingDescription;

  /// No description provided for @financialCourseSavingTitle.
  ///
  /// In en, this message translates to:
  /// **'Saving Strategies'**
  String get financialCourseSavingTitle;

  /// No description provided for @financialCourseSavingDescription.
  ///
  /// In en, this message translates to:
  /// **'Build an emergency fund and save for goals'**
  String get financialCourseSavingDescription;

  /// No description provided for @financialCourseCreditTitle.
  ///
  /// In en, this message translates to:
  /// **'Understanding Credit'**
  String get financialCourseCreditTitle;

  /// No description provided for @financialCourseCreditDescription.
  ///
  /// In en, this message translates to:
  /// **'How credit scores work and why they matter'**
  String get financialCourseCreditDescription;

  /// No description provided for @financialCourseInvestingTitle.
  ///
  /// In en, this message translates to:
  /// **'Investing 101'**
  String get financialCourseInvestingTitle;

  /// No description provided for @financialCourseInvestingDescription.
  ///
  /// In en, this message translates to:
  /// **'Introduction to stocks, bonds, and retirement'**
  String get financialCourseInvestingDescription;

  /// No description provided for @financialCourseLevelBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get financialCourseLevelBeginner;

  /// No description provided for @financialCourseLevelIntermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get financialCourseLevelIntermediate;

  /// No description provided for @financialCourseProgress.
  ///
  /// In en, this message translates to:
  /// **'{percent}% complete'**
  String financialCourseProgress(Object percent);

  /// No description provided for @financialArticlesTitle.
  ///
  /// In en, this message translates to:
  /// **'Articles & Resources'**
  String get financialArticlesTitle;

  /// No description provided for @financialArticleReduceExpenses.
  ///
  /// In en, this message translates to:
  /// **'5 Ways to Reduce Monthly Expenses'**
  String get financialArticleReduceExpenses;

  /// No description provided for @financialArticleUnderstandingPaycheck.
  ///
  /// In en, this message translates to:
  /// **'Understanding Your Paycheck'**
  String get financialArticleUnderstandingPaycheck;

  /// No description provided for @financialArticleRetirementTwenties.
  ///
  /// In en, this message translates to:
  /// **'Planning for Retirement in Your 20s'**
  String get financialArticleRetirementTwenties;

  /// No description provided for @commonCategoryBudgeting.
  ///
  /// In en, this message translates to:
  /// **'Budgeting'**
  String get commonCategoryBudgeting;

  /// No description provided for @commonCategoryIncome.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get commonCategoryIncome;

  /// No description provided for @commonCategoryInvesting.
  ///
  /// In en, this message translates to:
  /// **'Investing'**
  String get commonCategoryInvesting;

  /// No description provided for @altHomeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Good morning, {name}'**
  String altHomeGreeting(Object name);

  /// No description provided for @altHomeSummary.
  ///
  /// In en, this message translates to:
  /// **'Here\'s your wellbeing summary'**
  String get altHomeSummary;

  /// No description provided for @altHomeScoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Your Wellbeing Score'**
  String get altHomeScoreLabel;

  /// No description provided for @altHomeScoreTrend.
  ///
  /// In en, this message translates to:
  /// **'+{percent}% this week'**
  String altHomeScoreTrend(Object percent);

  /// No description provided for @altHomeScoreDescription.
  ///
  /// In en, this message translates to:
  /// **'Great progress! Your consistent mindfulness exercises are paying off.'**
  String get altHomeScoreDescription;

  /// No description provided for @altHomeQuickAccess.
  ///
  /// In en, this message translates to:
  /// **'Quick Access'**
  String get altHomeQuickAccess;

  /// No description provided for @commonQuickAccessCounseling.
  ///
  /// In en, this message translates to:
  /// **'Counseling'**
  String get commonQuickAccessCounseling;

  /// No description provided for @commonQuickAccessFinancialAid.
  ///
  /// In en, this message translates to:
  /// **'Financial Aid'**
  String get commonQuickAccessFinancialAid;

  /// No description provided for @commonQuickAccessLegal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get commonQuickAccessLegal;

  /// No description provided for @altHomeRecommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended For You'**
  String get altHomeRecommended;

  /// No description provided for @altHomeRecommendationMeditationTitle.
  ///
  /// In en, this message translates to:
  /// **'Start a guided meditation'**
  String get altHomeRecommendationMeditationTitle;

  /// No description provided for @altHomeRecommendationMeditationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'5-min session to find calm'**
  String get altHomeRecommendationMeditationSubtitle;

  /// No description provided for @altHomeRecommendationResilienceTitle.
  ///
  /// In en, this message translates to:
  /// **'Read: Building Resilience'**
  String get altHomeRecommendationResilienceTitle;

  /// No description provided for @altHomeRecommendationResilienceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tips for overcoming challenges'**
  String get altHomeRecommendationResilienceSubtitle;

  /// No description provided for @altHomeRecommendationCounselorTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect with a counselor'**
  String get altHomeRecommendationCounselorTitle;

  /// No description provided for @altHomeRecommendationCounselorSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Book a confidential session'**
  String get altHomeRecommendationCounselorSubtitle;

  /// No description provided for @navDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get navDiscover;

  /// No description provided for @navSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get navSupport;

  /// No description provided for @altSplashTagline.
  ///
  /// In en, this message translates to:
  /// **'Empowering wellbeing and\nresilience.'**
  String get altSplashTagline;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'rw'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'rw': return AppLocalizationsRw();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
