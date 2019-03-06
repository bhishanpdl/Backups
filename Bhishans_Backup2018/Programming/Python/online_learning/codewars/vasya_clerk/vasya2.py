def tickets(people):
    total_25 = 0
    total_50 = 0
    total_100 = 0
    for person in people:
        if person == 25:
            total_25 += 1
        if person == 50:
            total_50 += 1
            total_25 -= 1
            if total_25 < 0:
                return "NO"
        if person == 100:
            total_100 += 1
            if total_50 > 0 and total_25 > 0:
                total_50 -= 1
                total_25 -= 1
                continue
            elif total_25 >= 3:
                total_25 -= 3
                continue
            else:
                return "NO"
    return "YES"


print(tickets([25, 25, 50, 50, 50]))




##======================================================================
## method 2
##======================================================================
def tickets(a):
    n25 = n50 = n100 = 0
    for e in a:
        if   e==25            : n25+=1
        elif e==50            : n25-=1; n50+=1
        elif e==100 and n50>0 : n25-=1; n50-=1
        elif e==100 and n50==0: n25-=3
        if n25<0 or n50<0:
            return 'NO'
    return 'YES'

print(tickets([25, 25, 50, 50, 50]))





##======================================================================
## method3
##======================================================================
def tickets(people):
    cashRegister = {25: 0, 50: 0, 100: 0};
    ticketPrice = 25;
    for paid in people:
        cashRegister[paid] += 1;
        while paid > ticketPrice:
            changeGiven = False;
            """ Check if we have a bill in the register that we use as change """
            for bill in sorted(cashRegister.keys(), reverse=True):
                """ Hand out hhange if possible and still needed """
                if (paid - ticketPrice >= bill) and (cashRegister[bill] > 0):
                    paid = paid - bill;
                    cashRegister[bill] -= 1;
                    changeGiven = True;
            """ Return "NO" if we were unable to give the change required """
            if (paid > ticketPrice) and (changeGiven == False):
                    return "NO";
    return "YES";

print(tickets([25, 25, 50, 50, 50]))




##======================================================================
##  metho3
##======================================================================
def tickets(people):
    cash = []
    for i in people:
        i = i/25
        cash.append(i)
        i -= 1
        if i>0:
            for j in sorted(cash, reverse=True):
                if j <= i:
                    cash.remove(j)
                    i -= j
            if i>0:
                return("NO")
    return "YES"


print(tickets([25, 25, 50, 50, 50]))






 ##======================================================================
 ## method4
 ##======================================================================
def tickets(people, cost=25, bills=[100, 50, 25]):
    count = dict.fromkeys(bills, 0)
    for change in people:
        count[change] += 1
        change -= cost
        for bill in bills:
            if change >= bill:
                c = min(change // bill, count[bill])
                count[bill] -= c
                change -= c * bill
        if change: return "NO"
    return "YES"


print(tickets([25, 25, 50, 50, 50]))


 ##======================================================================
 ## method4
 ##======================================================================
from collections import defaultdict
def tickets(queue):
    vasya_acc = defaultdict(int)
    for person in queue:
        vasya_acc[person]+=1
        if person == 50:
            vasya_acc[25] -= 1
            if vasya_acc[25] < 0:
                return 'NO'
        if person == 100:
            vasya_acc[25] -= 1
            vasya_acc[50] -= 1
            if vasya_acc[25] < 0 or vasya_acc[50] < 0:
                vasya_acc[50] += 1
                vasya_acc[25] -= 2
                if vasya_acc[25] < 0:
                    return 'NO'
    return 'YES'


print(tickets([25, 25, 50, 50, 50]))



