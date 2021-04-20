class Appointment

  attr_accessor :location, :purpose, :hour, :min
  
  def initialize(location,purpose, hour, min)

      @location = location
      @purpose = purpose
      @hour = hour
      @min = min

  end

end

class MonthlyAppointment < Appointment

    attr_accessor :day

    def initialize(location,purpose,hour,min,day)

      super(location,purpose,hour,min) #Super llama a las variables de instancia de la clase Padre.
      @day = day

    end

    def occurs_on?(day) 
      self.day == day
    end

    def to_s #Metodo to_s es llamado con los puts sobre los objetos instanciados y sobreescribe el comportamiento del objeto
      "Reunión mensual en #{self.location} sobre #{self.purpose} el día #{self.day} a la(s) #{self.hour}:#{self.min}."
    end

end

class DailyAppointment < Appointment

  def occurs_on?(hour,min)
    self.hour == hour && self.min == min
  end

  def to_s
    "Reunión diaria en #{self.location} sobre #{self.purpose} a la(s) #{self.hour}:#{self.min}."
  end

end

class OneTimeAppointment < Appointment

    attr_accessor :day, :month, :year
    
    def initialize(location,purpose,hour,min,day,month,year)

      super(location, purpose,hour, min)
      @day = day
      @month = month
      @year = year

    end

    def occurs_on?(day,month,year)
      self.day == day && self.month == month && self.year == year
    end

    def to_s
      "Reunión única en #{ self.location } sobre #{ self.purpose } el #{ self.day }/#{ self.month }/#{ self.year } a la(s) #{ self.hour }:#{ self.min }."
    end

end


puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)

puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)

puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)


#NOTAS DE ESTUDIO

#SUPER es una instrucción que nos permite llamar a un método de una superclase que se llama exactamente igual. Esto nos permite operar sobre ese método sin tener que sobrescribir el método completo.

#Método occurs_on? es un metodo que hace referencia a ocurrencia en el tiempo.