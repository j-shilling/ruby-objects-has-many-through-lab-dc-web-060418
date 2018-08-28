class Doctor
  @@all = []
  def self.all
    @@all
  end

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

  def appointments
    Appointment.all.select { |apt| apt.doctor == self }
  end

  def patients
    self.appointments.map { |apt| apt.patient }
  end

end
