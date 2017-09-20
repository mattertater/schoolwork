#include "TaxConstants.hpp"
#include "Tax.hpp"

#include <iostream>



void taxTaker(taxPayer &a){
        std::cout<<"Enter this year's income for tax payer "<<a.index<<": ";
        std::cin>>a.income;

        std::cout<<"Enter the tax rate for tax payer "<<a.index<<": ";
        std::cin>>a.taxRate;

        a.taxes=(a.income*(a.taxRate/100));

}

void taxPrint(taxPayer a){
    std::cout<<"Tax Payer # "<<a.index<<": $ "<<a.taxes<<std::endl;
}
