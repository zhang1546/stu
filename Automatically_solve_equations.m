%%
%运行范例说明(打开脚本后按F5运行,照如下格式输入,最后自行使用LATEX命令将公式转为LATEX指令)
%>>Automatically_solve_equations
%请输入方程数量：2
%请输入方程，用'括起来，返回上一个公式输入'del':'p=(Ed*Id+Eq*Iq)*3/2'
%ans =
%方程1为:p=(Ed*Id+Eq*Iq)*3/2
%    'p'
%    'Ed'    'Eq'    'Id'    'Iq'    'p'
%    'Ed'    'Eq'    'Id'    'Iq'    'p'
%    'Ed'    'Eq'    'Id'    'Iq'    'p'
%    'Ed'    'Eq'    'Id'    'Iq'    'p'
%请输入方程，用'括起来，返回上一个公式输入'del':'q=(Ed*Iq-Eq*Id)*3/2'
%ans =
%方程2为:q=(Ed*Iq-Eq*Id)*3/2
%    'Ed'    'Eq'    'Id'    'Iq'    'p'    'q'
%    'Ed'    'Eq'    'Id'    'Iq'    'p'    'q'
%    'Ed'    'Eq'    'Id'    'Iq'    'p'    'q'
%    'Ed'    'Eq'    'Id'    'Iq'    'p'    'q'
%    'Ed'    'Eq'    'Id'    'Iq'    'p'    'q'
%请输入待求解变量，格式'id,iq,...'：'Id,Iq'
%Id =
%(2*(Ed*p - Eq*q))/(3*(Ed^2 + Eq^2))
%Iq =
%(2*(Eq*p + Ed*q))/(3*(Ed^2 + Eq^2))
%%
%正式程序
num = input('请输入方程数量：');
equ = cell(1,num);
i=1;
while i<=num
    equ{i} = input('请输入方程，用''括起来，返回上一个公式输入''del'':');
    if equ{i}(1,1:3) == 'del'
        i = i-1;
        continue;
    end   
    sprintf('方程%d为:%s',i,equ{i})
    len = length(equ{i});
    alpha = isstrprop(equ{i},'alpha');
    pos = 1;
    for j = 1:len
        if alpha(j) ~= 1      
            eval(['syms',' ',equ{i}(1,pos:j-1)]);
            pos = j+1;            
        end
    end
    i=i+1;
end
sol=input('请输入待求解变量，格式''id,iq,...''：');
equation = '';
equation = ['''',equ{1},'''',equation];
for i = 2:num
    equation = ['''',equ{i},'''',',',equation];
end
eval(['[',sol,']=','solve(',equation,',',sol,')'])

