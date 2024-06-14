# MedInsure Claims Analysis

MedInsure is a medical insurance company helping thousands of people cover the cost of preventative care and medical bills throughout the US. They offer four plan types (bronze, silver, gold, and platinum) with different premiums and claim coverage rates. In 2019, MedInsure launched a series of new campaign categories covering topics like wellness tips, the affordability of their plans, and preventative care. I created an interactive Tableau dashboard to report on marketing, signup, and claims metrics to investigate the campaign category performance and provide recommendations on future budget allocation with two goals in mind: (1) increasing the number of customer signups and (2) raising awareness of MedInsure's brand across the country. Lastly, I created a PowerPoint presentation for the marketing team to present my insights and recommendations. 

## Interactive Tableau Dashboard

The interactive dashboard can be found in Tableau Public [here](https://public.tableau.com/app/profile/astrosica/viz/MedInsureClaimsDashboard/Dashboard). This dashboard enables users to filter by plan type, campaign type, and customer state, focusing on marketing, signup, and claim metrics.

![MedInsure_Dashboard](https://github.com/jessicacampbell-astro/MedInsure_claims_analysis/assets/23153120/05d95cf6-f5e8-454a-8b3d-c0a81c69a8b1)

## Data Structure

The data consisted of 70K records over three tables: (1) marketing campaigns, (2) customer signups and demographics, and (3) claim information. The entity relationship diagram (ERD) for this dataset is shown below:

![MedInsure_ERD](https://github.com/jessicacampbell-astro/MedInsure_claims_analysis/assets/23153120/3a9cbbe6-d83f-4d51-9807-92ebcc8524ab)

## Key Metrics

In evaluating campaign performance, the analysis focused on the following key metrics:

- **Impressions**: The number of people who saw a marketing campaign.
- **Cost per Impression**: The average dollar amount spent on obtaining an impression.
- **Click-Through Rate (CTR)**: The percentage of people who saw a marketing campaign and clicked on the associated link.
- **Cost per Click (CPC)**: The average dollar amount spent on each marketing campaign click.
- **Signups**: The number of people who signed up for an insurance plan.
- **Signup Rate**: The percentage of people who saw a marketing campaign and signed up for an insurance plan.
- **Cost per Signup**: The average dollar amount spent on obtaining a customer signup.
- **Claim count**: The number of claims.
- **Claim amount**: The dollar claim amount.

## Summary of Insights

### Marketing Metrics

- The Health For All campaign had the highest CTR (25%) despite having the lowest impressions (171K).
- The Health For All and Benefit Updates campaigns performed 2-3 times better than the average CTR, at 25% and 22% respectively.
- The Golden Years Security campaign had the lowest CTR (1%), highest CPC ($0.68; nearly six times the average), and only about half the average impressions (422K).
- Despite having the fourth-highest impressions, the Family Coverage Plan campaign had zero clicks.

### Signup Metrics

- The Healthy Living campaign had the highest number of signups (3.7K) with a particularly low cost per signup ($1.79) and surprisingly low signup rate (0.3%).
- The Golden Years Security campaign had the lowest signup rate (0.01%), lowest number of signups (23), and highest cost per signup ($177).
- The Family Coverage Plan campaign had one of the lowest signup rates (0.03%) and one of the lowest number of signups (300), possibly due to zero clicks on the marketing campaign.

### Claims Metrics

- The Compare Health Coverage campaign had the highest average claim amount ($410) and the highest total claim amount ($3.9M), possibly due to a post-pandemic surge in claim amounts.
- The Golden Years Security campaign had the lowest average claim amount ($215) and the lowest total claim amount ($16K), likely because it was severely underperforming in marketing and signup metrics.
- The claim amounts for the Compare Health Coverage campaign saw a rapid increase at the beginning of the COVID-19 pandemic and have since rapidly declined to higher than pre-pandemic amounts.
- Despite having the highest to-date average and total claim amounts, the relative success of the Health For All campaign has slowly declined over the pandemic.

## Recommendations

The team provides the following recommendations:
- Prioritize Health for All and #CoverageMatters campaign categories, as these had the highest signup rates and lowest cost per signup.
- Reallocate budget from Golden Years Security to #CoverageMatters and #HealthyLiving campaign categories, which have 0.4-1% of the signup cost and 150-160x the number of signups.
- Consider removing Offer Announcement campaign types and prioritizing Health Awareness and Product Promotion, which have 35-40x the signup rate and 55-90x the number of signups.
- Prioritize Benefit Updates as they have one of the highest CTRs and lowest cost per clicks.
- Continue investing in Health for All campaigns for their high CTR, but investigate drivers for high cost per click.
- Reallocate budget for Health Tips to Customer Testimonial, as CTR is the same but impressions are more than 2x higher.

## PowerPoint Presentation

The PowerPoint presentation presenting the above insights and recommendations for the marketing team can be found [here](https://github.com/jessicacampbell-astro/MedInsure_claims_analysis/blob/main/presentation/MedInsure_presentation.pdf). Some highlights are shown below:

![PPT_title](https://github.com/jessicacampbell-astro/MedInsure_claims_analysis/assets/23153120/f68e03fa-6e30-458e-b460-04b9d4cb35fa)
![PPT_signup_rates](https://github.com/jessicacampbell-astro/MedInsure_claims_analysis/assets/23153120/7e7efb2d-903f-422c-a254-7beb31dc6d0b)
![PPT_recs](https://github.com/jessicacampbell-astro/MedInsure_claims_analysis/assets/23153120/c596850f-a74e-4120-82b0-7367e58d545a)
![PPT_tech_process](https://github.com/jessicacampbell-astro/MedInsure_claims_analysis/assets/23153120/109c1f84-5d13-4778-86b1-6bbef7177384)

## Contact

Feel free to contact me on [LinkedIn](https://www.linkedin.com/in/jessicacampbell-astro/)!
