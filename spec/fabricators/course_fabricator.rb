# encoding: utf-8
Fabricator(:course) do
  from_date { Date.new(2011,9,1)  }
  to_date { Date.new(2011,10,2)  }
  status{ 1 }
  number{10}
  location{"島根"}
end

