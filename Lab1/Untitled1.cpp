#include <bits/stdc++.h>
using namespace std;
int main()
{
        long long int n,m,sum=0;
        cin>>n>>m;
        long long int p[m+1],s[m+1],d[n+1];
        for(int j=0;j<m;j++)
            cin>>p[j];
        for(int j=0;j<m;j++)
            cin>>s[j];
        for(int j=0;j<n;j++)
        {
            cin>>d[j];
            sum+=d[j];
        }
        long long int result=sum-(n*p[0])-s[0];
        for(int j=0;j<m;j++)
        {
            long long int xxx=sum-(n*p[j])-s[j];
            //cout<<p[j]<<" "<<xxx<<endl;
            if(xxx>result)
                result=xxx;
        }
        if(result>0)
            cout<<"Profit"<<" "<<result<<endl;
        else if(result<0)
            cout<<"Loss"<<" "<<result*(-1)<<endl;
        else
            cout<<"Neutral"<<endl;
    return 0;
}
