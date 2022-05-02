//DML - Hands On 3
//1 - Atualizar o valor da oportunidade
public static void atualizarOportunidade (Id idConta, Decimal novoValor) {
    //declaro a classe, parametros vem entre parenteses
    //criar variavel sobre o objeto em questão para receber a query 
    Opportunity oportunidadeAtualizar = [
        //objeto e variavel
        //query
        SELECT AccountId, Name, Amount
        FROM 	Opportunity
        WHERE Id =: idConta
        //fazemos isso porque o idConta precisa ser genérico, ele está como uma variável, só muda no debug
    ];
    
    oportunidadeAtualizar.Amount = novoValor;

    update oportunidadeAtualizar;
}
//2 - Atualizar campo Ativo para false

public static void atualizarAtivo (Id idConta, Boolean false) {

    Account ativoAtualizar = [
        SELECT AccountId, Name, Active__c
        FROM Account
        WHERE Id =: idConta
        
    ];

    ativoAtualizar.Active__c = false

    update ativoAtualizar;
}

//3 Atualizar Status para "Paga"
// duvida sobre segundo parametro, está correto? 
public static void atualizarStatus (Id idConta, Status__c = 'Pago') {

    Parcela__c statusAtualizar = [
        SELECT AccountId, Name, Status__c
        FROM Parcela__c
        WHERE Id =: idConta
        
    ];
    
    parcela__c.status__c = 'Pago';

    update statusAtualizar;
}
    
//4 - Deletar o registro de uma parcela através de um Id
public static void deletarParcela (Id idConta) {

    Parcela__c registroDeletar = [ 
    SELECT Id
    FROM Parcela__c
    WHERE Id =: idConta
    
    ];

    delete registroDeletar;

}

//5 - Método que crie um Contato para Conta conforme as regras
public static void criarContato (Id idConta, String Name, String Title, Date Birthdate, String Email) {

    Account contato = new Contact (); 

    contato.Name = Name;
    contato.Title = Title;
    contato.Birthdate = Birthdate;
    contato.Email = Email;

    insert new Contact ;
}
