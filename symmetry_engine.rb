
class SymmetryEngine

  def self.symmetry?(matrix)
    !self.symmetry(matrix).empty?
  end

  def self.symmetry(matrix)
    symmetry = []
    (0..6).each do |i|
      symmetry << SymmetryEngine.sym_off_y_axis(matrix,i) if SymmetryEngine.sym_off_y_axis(matrix,i)
      symmetry << SymmetryEngine.sym_on_y_axis(matrix,i) if SymmetryEngine.sym_on_y_axis(matrix,i)
      symmetry << SymmetryEngine.sym_off_x_axis(matrix,i) if SymmetryEngine.sym_off_x_axis(matrix,i)
      symmetry << SymmetryEngine.sym_on_x_axis(matrix,i) if SymmetryEngine.sym_on_x_axis(matrix,i)
    end
    symmetry
  end

  private

  #     F   0
  # 1   N   0
  #     F   1
  # 1   N   1
  #     F   2
  # 1   N   2
  #     F   3
  # 1   N   3
  #     F   4
  # ^   ^   ^ row number
  # ^   ^ F=off-row, N=on-row
  # ^ bit column

    def self.sym_off_x_axis(matrix,row_number)
      matrix_rows = matrix.row_vectors
      case row_number
        when 1
          "RF1" if matrix_rows[0] == matrix_rows[1] && matrix_rows[2].magnitude == 0  && matrix_rows[3].magnitude == 0
        when 2
          "RF2" if matrix_rows[1] == matrix_rows[2] && matrix_rows[0] == matrix_rows[3]
        when 3
          "RF3" if matrix_rows[2] == matrix_rows[3] && matrix_rows[0].magnitude == 0  && matrix_rows[1].magnitude == 0
        else
          false
      end
    end

    def self.sym_on_x_axis(matrix,row_number)
      matrix_rows = matrix.row_vectors
      case row_number
        when 1
          "RO1" if matrix_rows[0] == matrix_rows[2] && matrix_rows[3].magnitude == 0
        when 2
          "RO2" if matrix_rows[1] == matrix_rows[3] && matrix_rows[0].magnitude == 0
        else
          false
      end
    end

  #  1 1 1 1 1 1   bit columns
  # FNFNFNFNFNFNF  F=off-col, N=on-col
  # 0011223344556  col number

    def self.sym_off_y_axis(matrix,col_number)
      matrix_cols = matrix.column_vectors
      case col_number
        when 1
          "CF1" if matrix_cols[0] == matrix_cols[1] && matrix_cols[2].magnitude == 0.0 && matrix_cols[3].magnitude == 0.0 && matrix_cols[4].magnitude == 0.0 && matrix_cols[5].magnitude == 0.0
        when 2
          "CF2" if matrix_cols[1] == matrix_cols[2] && matrix_cols[0] == matrix_cols[3] && matrix_cols[4].magnitude == 0.0 && matrix_cols[5].magnitude == 0.0
        when 3
          "CF3" if matrix_cols[2] == matrix_cols[3] && matrix_cols[1] == matrix_cols[4] && matrix_cols[0] == matrix_cols[5]
        when 4
          "CF4" if matrix_cols[3] == matrix_cols[4] && matrix_cols[2] == matrix_cols[5] && matrix_cols[0].magnitude == 0.0 && matrix_cols[1].magnitude == 0.0
        when 5
          "CF5" if matrix_cols[4] == matrix_cols[5] && matrix_cols[0].magnitude == 0.0 && matrix_cols[1].magnitude == 0.0 && matrix_cols[2].magnitude == 0.0 && matrix_cols[3].magnitude == 0.0
        else
          false
      end
    end
    def self.sym_on_y_axis(matrix,col_number)
      matrix_cols = matrix.column_vectors
      case col_number
        when 1
          "CN1" if matrix_cols[0] == matrix_cols[2] && matrix_cols[3].magnitude == 0.0 && matrix_cols[4].magnitude == 0.0 && matrix_cols[5].magnitude == 0.0
        when 2
          "CN2" if matrix_cols[1] == matrix_cols[3] && matrix_cols[0] == matrix_cols[4] && matrix_cols[5].magnitude == 0.0
        when 3
          "CN3" if matrix_cols[2] == matrix_cols[4] && matrix_cols[1] == matrix_cols[5] && matrix_cols[0].magnitude == 0.0
        else
          false
      end
    end
end