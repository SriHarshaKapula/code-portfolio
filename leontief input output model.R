# Intermediate flow matrix.
flowtable <- rbind( c( 150 , 500 ), c( 200 , 100 ) )
# Final demand.
finaldemand <- rbind( c( 350 ), c( 1700 ) )
# Bind into input-output table.
inputoutputtable <- cbind( flowtable , finaldemand )

# Convert object to data.frame.
inputoutputtable <- as.data.frame( inputoutputtable )

# Name columns of table (dataframe)
names( inputoutputtable ) <- c("x1" , "x2" , "finaldemand")

# Calculate total output, add final demand and intermediate columns:
inputoutputtable$totaloutput <- inputoutputtable$x1 +
  inputoutputtable$x2 +
  inputoutputtable$finaldemand

# Show the small IO table.
inputoutputtable

# making total output vector as a separate object. Use later.
totaloutput <- inputoutputtable$totaloutput

## Calcate coefficient matrix:
z <- ( totaloutput )^-1 * diag( 2 )
A <- flowtable %*% z

# Show A
A

#Identity matrix minus technical coefficient matrix.
IminusA <- diag( 2 ) - A

## Calculate inverse.
L <- solve( IminusA ) 
# Show Leontief matrix.
L
