package utils;

public class MessageSystem 
{
	
	
	public static void messageError(Class<?> _class, Exception _messageError, String _comentario)
	{
		String nameClass=_class.getEnclosingClass().getSimpleName();
		String nameMethod=_class.getEnclosingMethod().getName();
		
		System.out.println("************************* ERROR *********************" +"\n");
		
		System.out.println("Class:      "+nameClass);
		System.out.println("Method:     "+nameMethod);
		System.out.println("Comentario: "+_comentario);
		System.out.println("Error:      "+_messageError + "\n");
		
		System.out.println("*****************************************************" +"\n");
	}
	
	public static void messageEvents(Class<?> _class, String _messageEvent)
	{
		String nameClass=_class.getEnclosingClass().getSimpleName();
		String nameMethod=_class.getEnclosingMethod().getName();
		
		System.out.println("-------------------------- EVENTO --------------------------" +"\n");
		
		System.out.println("Class:  "+nameClass);
		System.out.println("Method: "+nameMethod);
		System.out.println("Evento: "+_messageEvent + "\n");
		
		System.out.println("------------------------------------------------------------" +"\n");
	}

}
