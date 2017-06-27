# ParseStructuredFiles

ParseStructuredFiles es una gema para el parseo de archivos con una estructura fija de a líneas.
Esta estructura es especificada en las subclases.

Para agregar un nuevo tipo de archivo para parsear, se subclasifica ParseStructuredFiles::PlainText, definiendo una variable de clase, o un método de instancia con una expresión regular siguiendo el siguiente formato:

```ruby
/(?<nombre>.{cantidad_de_caracteres})/
```

Siguiendo lo anterior mencionado, se puede definir de la siguiente manera:

```ruby
@@campo = /(?<nombre>.{cantidad_de_caracteres})/
```

O como un método:

```ruby
def campo
  /(?<nombre>.{cantidad_de_caracteres})/
end
```

Ambas definiciones son validas.

Luego se tiene que redefinir el método parse, discriminando las líneas de datos, de las líneas de control (como podria ser un header).

Suponiendo que en este nuevo tipo de archivo no se cuenta con lineas de control quedaría algo como lo siguiente:

```ruby
def parse(line)
  super(line, @@campo).as_data_fieldset
end
```

o si la expresión se definió como un método

```ruby
def parse(line)
  super(line, campo).as_data_fieldset
end
```

Si se contara con líneas de control que se buscan almacenar, se puede resolver de la siguiente manera. Suponiendo que la línea de control header comienza siempre con una letra 'h', y se busca almacenar en una variable de instancia 'header', se puede hacer lo siguiente:

```ruby
def parse(line)
  case line[0]
  when 'h'
    @header = super(line, @@campo)
  else
    super(line, @@campo)
  end
end
  ```
  
  De igual manera, si se contara con la estructura dentro de un método
  
  ```ruby
  def parse(line)
    case line[0]
    when 'h'
      @header = super(line, campo)
    else
      super(line, campo)
    end
  end
  ```
  
  Se puede contar con tantas expresiones como se desee, pero todas deben respetar el mismo formato, teniendo definido un tag para la data que se busca almacenar en un hash.
  De no contar con un tag, la data se parseara, pero no será accesible.
  
  Luego de esto, se puede contar con cualquier método que se crea necesario, como podria ser un método de validación.
